Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0125.outbound.protection.outlook.com [207.46.100.125])
	by mail.openembedded.org (Postfix) with ESMTP id 11D746010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 15:45:29 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BL2PR04MB834.namprd04.prod.outlook.com (10.242.196.145) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Thu, 19 Nov 2015 15:29:50 +0000
Message-ID: <564DEAE7.4050708@ni.com>
Date: Thu, 19 Nov 2015 09:29:43 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
References: <e54ec1320521a08198512388736dbf21e832fe94.1447842013.git.adrian.ratiu@ni.com>	<5725c294cf5d9fdb98cb5531f30f8f46e66a20fb.1447842013.git.adrian.ratiu@ni.com>	<564CA097.1030703@ni.com>
	<20151119103559.654e2af0@adi-pc-linux>
In-Reply-To: <20151119103559.654e2af0@adi-pc-linux>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: SN1PR17CA0021.namprd17.prod.outlook.com (25.169.33.159) To
	BL2PR04MB834.namprd04.prod.outlook.com (10.242.196.145)
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB834;
	2:htEj0maTMCNc/uJAXlJmaxJWPij5X/lEX1Blei0Dqd8UzNoKLfIs7x3BRo9c50GOz84pOYGp6jGcVPN4kCa6gsBu8pkZYBo3inRAjsNz0+sSJFcZQbtlmxRZOLi/pZSKPJByhDVws63eLfs+HVyUUqP4MZBL/4X7GIsEY8QJUzw=;
	3:VN2aT7U0ufvvnoRzHuJDm5fKrQBYCMmms1qXHbl25boPAiGAepuqWwBFXWwbEyU09XoYV9aS/DbkxLzaaNSo/OKbULM1RtfpUnFRCCXDKtwi1YEP59dOeArXjACX/KkPxdYhhJcXaaewXtUiOHZQVA==;
	25:KN5UJHTX0R5sotmlswSNfvkK2FKMt6lSiP2O8LaPf2tDuRLrMRXp+nAJdauoZSczyxEmtyq8ULu6oL2yS4kheWgsRFbd/g3eRUfMRBMNVajSJb+FLqh3ZRyAO8Gbffr7e55bCRPViQiIQbHjbroj9xw0Ox0eFY3ETFa0/ysvos9zpqISm4DgHG6T+JdoghFa8XmtaIOjaVok8AUTPcucB2FxLlw1FDR+7vmO0dC6ZIvQUzlb94AzVG8frl4iwQs2Wfyca6jx1pJy8Ng4Tf+JEA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB834;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB834;
	20:LkSyTFkYAHooVxhMAdpj9cxtMFTTr7jztt121TCQts0uiqG3SozVibgwfg3pgcarQpP+jx3tIR/hUX2iOkTrRise5I5Az8wRRgB4ktUdAVnfssaHZ9yZJEtkAroR5FDBwLqFMitGV763CJ/DZT3wfc6ot7nJaob4ED0neWumN0BIwXYzeS9Mqr7meerOHe+yrB1oEBFIZ4ttDN+8Ui2ww7EOevdUsebITqFJcQgDv0Uuvooql49sN5AZfAgZoBCVTDdE2tGLhcQ6+PQpoaTmNCAA1fuYgfzCOX5G2w7A7xxqPGTvHFW1rU8MOH0ueW4mr5U00c8GDy0O0nqV1N+6xx3/HnVy83c633bSZwZyVXsrBmejR/a3pZoSOjIiZvrwwAO5nX9HDNu/0f4t1jYk5U6I66NHTol0HxPE5JItwhbBA2VdO71tW9vVt+cRv8KQphDkfgR90oIHHBZMpTLI5t7rjyjsfGix0sQymnH7F8RjkTHL2t+o7hsffhFItsDuAJ9/n91Lx9H/uC1yMvDTreaUj3N3zp/Okmi4FwwmxCb5qQhPlAfoTyfV7IepSEPB2f68hV6iynntV1rL1FGFQhTocQc0pkUV00nfswlAz9E=
X-Microsoft-Antispam-PRVS: <BL2PR04MB834526F600FC034097E87F6861B0@BL2PR04MB834.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BL2PR04MB834; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB834; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB834;
	4:Rt/o6oklEHwOT2VdyuO1mAGhlMyoq/UxeMaPzyzoq+MOIn+cO/2I/5Nvldy3aaQn/+knF6EOp9wqMhc4rYnz9Npkvc5jOnMRxLKT/BJ3EX/5cmUxkxk4U60fmtEvRg4ZpieAShambdyAwS5qdLnB7I1jo+Fsp3o3GRB9TqBCdtbdjXroj6FuleWs04g7FLVDphQJhjomRPZam5PfOIEMKPad3LAFNkitkZ3CHPR7hAWd4LiaYFqzZFM6X4GR1gt+cyM3lKXm39TdDmCKJP03bkNOoFhmpXp3cGfYJK/9MabR71Gc8IRFaRK7Qg68loBk3G7KEVft/TFM19ufdl5wXZa0k0oghwiIGjZg6CWiJZHTfB5geCf4EFL+DMqP5p+c
X-Forefront-PRVS: 07658B8EA3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(24454002)(377454003)(199003)(189002)(479174004)(54356999)(23746002)(93886004)(101416001)(50986999)(33656002)(65816999)(106356001)(19580395003)(76176999)(189998001)(110136002)(87266999)(65806001)(19580405001)(66066001)(47776003)(5001960100002)(65956001)(83506001)(105586002)(5008740100001)(86362001)(77096005)(97736004)(64126003)(42186005)(5007970100001)(80316001)(4001350100001)(36756003)(2950100001)(122386002)(575784001)(40100003)(586003)(59896002)(87976001)(230700001)(5004730100002)(50466002)(81156007)(3846002)(6116002)(92566002)(450100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB834; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BL2PR04MB834;
	23:98HXyZgRFhZdQcZY2yIyJg7jJnv0N3bvJUmx07?=
	=?Windows-1252?Q?oTs0H5mQcSMGLegSARO9JuR45x9u+LG800QRDv8ybG25Xf+FMNMxHFTO?=
	=?Windows-1252?Q?rUWqh7EWci1ACSMiGlyOZx3hhpeuZkJ8AcM1+xKYSCnRVN9GJ/vfOa8N?=
	=?Windows-1252?Q?IvpOiqUCcxxcBcNqaCpI8AwkWhEODWeLjMV/OAbhicacRFE9WvjbbtHY?=
	=?Windows-1252?Q?hZXmndWbO4G09NY9aawFdBC8ge6sme6dpr/5OQLXXx3lPnyc162Bg7h7?=
	=?Windows-1252?Q?nyzUqlVV78oTmjp8fxKYSVVPtNcD3HgoTcS2X6aogE4crXOp6xN/TJI0?=
	=?Windows-1252?Q?/J6LxW97gcWwL6Q4Fvz20uK3Bc0DX3b15a5TzFD746BnkwsfD9/zGUPd?=
	=?Windows-1252?Q?s8MILZhSRCy/cz/UmYV/IDxKWBds1tQyiukceZXJEDfLnx4lnVbuV0b/?=
	=?Windows-1252?Q?eDGZhZELUbHmC20lFQFQbSHlmbgOm786VD31nb+APD7vqwtaTh/XyGix?=
	=?Windows-1252?Q?RgC44fEt6EC906lYIRTB7W9riAiX88k9K686vpNRn0V0EX5jXA6OTDwW?=
	=?Windows-1252?Q?Y3dcb/oZ5kVWJHWlYl2cOa+TjRkdQLyOuf/nm5P6HpFhFeC3IEGWcDl+?=
	=?Windows-1252?Q?qb5FD/tFXS9L3Q936i8Hux2mhlNrFqNkTYCuZ9fx6Kh2l/Hx+7YJmhDV?=
	=?Windows-1252?Q?zJqAT2WAub71BmVyfP611+8ncD4ruLshGfQuRxTeDOhOfvMMCkut/jSW?=
	=?Windows-1252?Q?lx/RFuD9kLCvJnn+KkeVWFv7E6KBE8SKJeUEp0jCq1ggmDODGvpGDmDp?=
	=?Windows-1252?Q?4KRiuFBAr1Opl8+4vfmYRv0XZwxA5CX42dj0n0OS4sivtgYc9RKYyESq?=
	=?Windows-1252?Q?efZUuV/5tk+MNTNcAzIjx5DiG/7C7FOrH1AXRgh6gHyu80kprTPdZvPY?=
	=?Windows-1252?Q?yKQS50m1LR+kHodMOT8JtJGeK9sPrtVYo90/JePd6QEHpKxKojrc3fR4?=
	=?Windows-1252?Q?i1wx3U0G+1PYZvUx3/JG8OsFy8c5suvzgeG5GX2Zeb5+y8BmdwQcmnjn?=
	=?Windows-1252?Q?SO3nCq/QoRkVZqhwu5eMdqkFgheCDGOCS4TyfOCfxTwReTwjh3PXCJzY?=
	=?Windows-1252?Q?t3NEwyvNmIPoKaz4YS61URl7u7bv8IrWw2AvtS1kTkGERjVelKw0j/A5?=
	=?Windows-1252?Q?zrhAqBj/0lZAYcx95bE5RMeqxyes3nK5VInmIhmB3jNuT0W4KQFACSzd?=
	=?Windows-1252?Q?jlzeV4DPeXq5qQRtcOokqPjTOyUNJh5RfhlwNEK323pSaaxFMbxO6Dxl?=
	=?Windows-1252?Q?sL1DXhpuUYQfm0YUF2YdEIC9WqJsPbRM3h4MpyiDm3g6UOMACYAMp1Io?=
	=?Windows-1252?Q?qkL7FM96CmeSniDQwOOw/kv3TZ3pbyj3C+UHl/DNLgMPPB32M58w3RXc?=
	=?Windows-1252?Q?mI7nFLMpBLJTP7yoK80LslAT5OzcIioAeDvFxqPlwg3ko1I2UfCazjgZ?=
	=?Windows-1252?Q?bp7KQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB834;
	5:HmLQ6VUofC0cZWXyxkYpz8xXnr6/qwWkGRF21kDog5wuts+D98FnDq4RcMPSKX7JMp8oA6eUpbHNRIiXDqXbT3io3Iw2G6RlCluCed3YTsEiJXiZ8bFO7ykITKqrwqqzrP5vQkXas/ToAPLqbegX7w==;
	24:jgZSljfz9QYG9MB5OoSBDDyOhBb+mHwnJr2Ji7ewW8xX+74deXe242dwRmv2UguL8Nyp7IIYyF9DOXN0x6Lg1B9YTS3XUcodTrVPNkvnsMQ=;
	20:IYS8S/1SRVqwvbmw6h5fJF1jmYXRNEBYhu32KtuQCId7Q8YRfmW+v+s/acpXN1SZxWXbj6JbrFZqr2QckxH4rw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2015 15:29:50.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB834
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][PATCH v2 2/2] package_manager: support for signed IPK package feeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 15:45:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 11/19/2015 02:35 AM, Ioan-Adrian Ratiu wrote:
> On Wed, 18 Nov 2015 10:00:23 -0600
> Alejandro del Castillo <alejandro.delcastillo@ni.com> wrote:
> 
>>
>>
>> On 11/18/2015 04:25 AM, Ioan-Adrian Ratiu wrote:
>>> Create gpg signed package feeds if configured. Very similar to
>>> how rpm does it. Most of the config variables are shared with
>>> the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
>>> of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.
>>>
>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>> ---
>>>  meta/lib/oe/package_manager.py | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/lib/oe/package_manager.py
>>> b/meta/lib/oe/package_manager.py index 964fddc..a0fe0eb 100644
>>> --- a/meta/lib/oe/package_manager.py
>>> +++ b/meta/lib/oe/package_manager.py
>>> @@ -178,6 +178,7 @@ class OpkgIndexer(Indexer):
>>>              open(os.path.join(self.deploy_dir, "Packages"),
>>> "w").close() 
>>>          index_cmds = []
>>> +        index_sign_files = []
>>>          for arch_var in arch_vars:
>>>              archs = self.d.getVar(arch_var, True)
>>>              if archs is None:
>>> @@ -196,6 +197,8 @@ class OpkgIndexer(Indexer):
>>>                  index_cmds.append('%s -r %s -p %s -m %s' %
>>>                                    (opkg_index_cmd, pkgs_file,
>>> pkgs_file, pkgs_dir)) 
>>> +                index_sign_files.append(pkgs_file)
>>> +
>>>          if len(index_cmds) == 0:
>>>              bb.note("There are no packages in %s!" %
>>> self.deploy_dir) return
>>> @@ -206,7 +209,21 @@ class OpkgIndexer(Indexer):
>>>          if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>>>              raise NotImplementedError('Package feed signing not
>>> implementd for ipk')
>>
>> Forgot to remove?
> 
> No. Please read my previous mail, this is needed to avoid duplicating
> those arch loops.
> 
> I specifically asked the question if we can't get the package feed file
> names in another way; if so, then we can remove this.
> 

I think we might be talking about different things. Here is the piece of code
that should be removed:

if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
     raise NotImplementedError('Package feed signing not implementd for ipk')


-- 
Cheers,

Alejandro

