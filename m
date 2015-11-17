Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 5592 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Nov 2015 22:21:48 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0145.outbound.protection.outlook.com [207.46.100.145])
	by mail.openembedded.org (Postfix) with ESMTP id 1547460248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 22:21:48 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Tue, 17 Nov 2015 20:48:31 +0000
Message-ID: <564B928A.1090005@ni.com>
Date: Tue, 17 Nov 2015 14:48:10 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
References: <c9daa8b45c30f25d7b50c6a7df028de706809c21.1447773614.git.adrian.ratiu@ni.com>
	<3a685546bb14b90aa1f190f92e223001d594777c.1447773614.git.adrian.ratiu@ni.com>
In-Reply-To: <3a685546bb14b90aa1f190f92e223001d594777c.1447773614.git.adrian.ratiu@ni.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: BY1PR15CA0035.namprd15.prod.outlook.com (25.162.17.173) To
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147)
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	2:Rs9AMVdNpDqAsj2XjrUB+rY+U9ugdcRwvwdUFGUOFLJucJoiqTkAONtldjmERwuA8/g4W7pyezZE3kvWAuslKK9Jb8avUyW5n4sEKnuZG05+bSSG5GDUH9V5aN/I2E7OCRbYuW4r4eudvETikNHs1NzIR4mjhe1fu0+SYAzcYoI=;
	3:QFRx96SWauMkFwYxJZzotRTgUSuBpVtpoasnCHRmH8SjUz9k9mnQnhGPA7i3FB2R9Lp0Ku/XoDH9xPLXEfaC9H9PpbJA79+2DQzuopcCsXaUt6LIWedfODzcF5rmc6W+4Tw4KciNyNS8hF4RTToItA==;
	25:otrRWnEa5j2NByGCdcZBtiFk9DpT88fyP6CEbqeSW61ZOPFCgMlwAD5gUvE3LNDDxlYhJuOf6o3XnQGpIcrNP0or1unGCp9UXgi09CoeOr/o2c/97VJBgAcfuZgd7mcONp4XDt4xtQdjOgC0yFBkpGvaCHsUtjjz3uvKX8gStojhmWpj8fRoz42BO2xDS2MvX3bO2eGNgeWVtK1tox360K2pur2iuRFGE5dplZLZCUK6tFdhlPXsI6zCyMCW/cKq
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR04MB844;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	20:MAmwe/UB+7QYPLUd5Gc877K9wHePgFtvpTg4OhT/+NkJNlZf+s75wBCuNgmDtgqKBkPEAwu6hqCpAJ7QTt83NLd5hSOdQQRNBS5E8TXVqymzVKyXXq0InusTAMzG9e+Ryd8eDIlQZIh0Wwdy6I6c8ekg1ibr5hGDwKQwKb/hvKWePaH9ABc6JEi1munqBz4nqwtVWhskB+i6sVoSFmn6nxQTXwmVA2GP0hEfnLiX07pVIWDvqdQFiFapQYUDoff65UrDJB3S9V6UxKXpfqTlB60aYZJEnETeTvzCyPxK88h70vD43nI30gUW3oPCoEgZvVqC9MwzuIuOBX2uVSWDEZVHW31SoIEkiVbZosU6D1cS7GFS6G1Hslwrira42Hlex5BnapgJHNMfLOOMulAzi3uxBrX+BxCPIlazWFuNYvGGOB7y/IBNtpWE4a7DIbsnmi4B+JScchV/3o8cFUd3IrP6ohlNrnk8nfekO7XTwPJMn7LSexp2bUYwsxqPrvfrYtFH5UqUTl3MT2Mmip96rKX7600vKgbeuWraDtnnK+B4EJ/gRKU31Um05AY99/5hWCAAgqKQoZ9EpoRXZ/g4sv/kn/d8+I0hyXzISQbqums=
X-Microsoft-Antispam-PRVS: <BN1PR04MB84479DEB625431FF1325777861D0@BN1PR04MB844.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(10201501046)(3002001);
	SRVR:BN1PR04MB844; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB844; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	4:ET8SYs4VTIYlwbfbQGcTaJDQpVMSxp0dJe5xS2aCscHcn4ivtU58gO6utDvxPKrcqi5C8ldfecpjprm0PFWn7Ffn83N8MqBQWOuornh7JI9bnq4zN7qc9rs6z2VUrUb3X6z5Y9MEULSjND8PbPOYjv2kYmnzz1qhsH62EgDxDZRQ0CLre1XoS3cJGtlTEtd26vKOEVTiTmGShFUFgX/EbBsqxRmOZOFC3/eeQthbvDeYFFSSlidbixh3iwusigqiMGN/WL/1PeNsQ751k/dAMesnrKqusok79PjOKNkirM+JxYATisgkX7OCSJ8KS17hU06mBV4dDoTrYasS6kKh+rIFyVhK3bx1PKeBPryuNmh0PojfrAuXkmQBNXVuld+I
X-Forefront-PRVS: 07630F72AD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(24454002)(377454003)(189002)(199003)(479174004)(5007970100001)(83506001)(66066001)(23746002)(5004730100002)(86362001)(77096005)(450100001)(2950100001)(65806001)(65956001)(5001770100001)(106356001)(101416001)(54356999)(105586002)(42186005)(50986999)(97736004)(189998001)(4001350100001)(87266999)(33656002)(5001960100002)(76176999)(65816999)(81156007)(107886002)(47776003)(122386002)(586003)(87976001)(92566002)(40100003)(80316001)(36756003)(230700001)(59896002)(19580405001)(19580395003)(5008740100001)(50466002)(64126003)(3076002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB844; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1PR04MB844;
	23:HmLIUc2xW13ea+j9j554SqC2Leqt7vT+wOBm+q?=
	=?Windows-1252?Q?S3bSdSzds5KdrxOb4DiD5FDHbr7Ke+22qTF16o3M/66x9xoefZRFYjUT?=
	=?Windows-1252?Q?4polOoCjOuLTIBdIeyEHhcQWY/CLHp45F5GWoqfC1uwCWBGbagK4dotN?=
	=?Windows-1252?Q?HDxzdlk/DGB8jnuo7SGthsyCFICvcJT9TqHJrZez+zC9AwhfcQMiXkRo?=
	=?Windows-1252?Q?A0TTSvPUFbXnn22Gu8/Wxkl6y1VxcoBrzuOZygMAhc7nhRjQr83ElG/b?=
	=?Windows-1252?Q?JA0n+1HCGBwLxrt9Zw8yFZkUxugkWgVVHuF82+GE9t9rHoY8WF7YFXx8?=
	=?Windows-1252?Q?Rd2Erp7/oq/eA6euBdW+yEwcCXdL8YezVuuRsgZDjwVnXsU03uwbM4eh?=
	=?Windows-1252?Q?ZXkijZyrtUb9tlrrFppKcBaihPVlEPBDkCByQ5WILdfy7Je3xbTOlpdC?=
	=?Windows-1252?Q?BzmSxWQ071hk7TbcUyO37p156vlMYJMn87gd40T4esXejqB713STr55W?=
	=?Windows-1252?Q?wDH2W6Yq7iCbF0cZLfasVLnxR+N/dnf+remrRSc0K8HoXJk/eDJsNCAA?=
	=?Windows-1252?Q?UtjXOaBHqoQnYQE5qdL0hiRL6Gb0jGRezcmQQDTHLVHKr1Q289lOwjx7?=
	=?Windows-1252?Q?WgZz134Yx/WHBV0o9G2nr5bCisjMsiYMj1AyiC6Pi2i9KHA6BDhm3d/X?=
	=?Windows-1252?Q?2czpGMp9BKyAKBphLswNLz0j97AMxHYNTKyHsNy8u7oHJlAo2eDkmGJH?=
	=?Windows-1252?Q?jE6KtoP7pj5xXBPB+FORMdmc6b7vNnv6dA5sYufNDLprPdvUvtyMseSb?=
	=?Windows-1252?Q?AtDytDOYKXAMxEHQL0NFLJOmOgJtPYUNCbp/p1etd8wjdIdOLvodk2QS?=
	=?Windows-1252?Q?6X2tER5Jt9AXd1bMUwsELvVb28G1g2TwVy/d8JHoxOhv+VAMTNk7AHJh?=
	=?Windows-1252?Q?32HmgNs85mRtWxmvyv2qm5oAVfbHXJ8iyGmxXhxXHHcqzi1tvChJRWeX?=
	=?Windows-1252?Q?9NMjBJH84EFXa9tDqBhszVmh5AJKzoIongniiecq4HzJO42i6/YZMyFS?=
	=?Windows-1252?Q?seUMeglLpEY1bYl0jXwqKChGpwxJFvwvaymG/eqfoPrHxY8GNX3jBwKr?=
	=?Windows-1252?Q?ZV6S/jR9wCtAdFBODCuqNJmggIAFJxvE+rbrU9RslION60OzMXPKgZmx?=
	=?Windows-1252?Q?H5CEbsK2N/DZL2rC3g/fZVXC+1I5tmr/xTOuDwIYA0+6yjCi4T2huNQV?=
	=?Windows-1252?Q?YFTq0Jsjca4CboGDDOFmPcSJaY98tHT5AWzrHN/RiSPcKHTs4YZ8/C2Q?=
	=?Windows-1252?Q?KBquGZPkff1vpgYWS6OHY9pg971UrvM3FFjvq3H01yeb8KIiG/q7rv4W?=
	=?Windows-1252?Q?ZlTc834uRph1cuvZHk7Iw0tRk9fW28dRYeG/7LdmZn8oh4hxU3rAEX+x?=
	=?Windows-1252?Q?7iqa4KyfZ2NAMd0l7a?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	5:H0SMzRHnRbbC/poqZuJTnJjTyEchgjkuRT0ZgaH0I+YQRUpkajzzZWCQLeUEQBUKX1Y9i14zEA77781AtUU6yz8qb+4Bute/H2G4cZfefaJ8iMTxKbQmj6boJbTcfpuVY8Z4aJP3yg1AzpoKC7t2hA==;
	24:xWM0/0uJvFT6SvlYt6AQJhcW6JATSccY0V4JkGDOWSD7apb0W8PWnGS0WhAdlsxF/EW6htaLjTXUFX7ouKvybtBmcFpp8KroYF64hSGPh1s=;
	20:bKjtxn50MizGq2P61pMn3Sh61CSFYnhm+NqUmzU/ezab4ZlAbSHS8PXrjwSyhTe0mqW9HOs2ryxazjLGCxIFuQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2015 20:48:31.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB844
Subject: Re: [oe][PATCH 2/2] package_manager: support for signed IPK package feeds
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
X-List-Received-Date: Tue, 17 Nov 2015 22:21:53 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 11/17/2015 09:26 AM, Ioan-Adrian Ratiu wrote:
> Create gpg signed package feeds if configured. Very similar to
> how rpm does it. Most of the config variables are shared with
> the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
> of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/lib/oe/package_manager.py | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 964fddc..8528c9b 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -174,10 +174,25 @@ class OpkgIndexer(Indexer):
>  
>          opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
>  
> +        gpg_cmd = ''
> +
> +        # all these variables are needed to succesfully sign the index, otherwise skip signing
> +        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1' and \
> +           self.d.getVar('PACKAGE_FEED_GPG_NAME', True) and \
> +           self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True):
> +                pkgfeed_gpg_name = self.d.getVar('PACKAGE_FEED_GPG_NAME', True)
> +                pkgfeed_gpg_pass = self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True)
> +                gpg_bin = self.d.getVar('GPG_BIN', True) or bb.utils.which(os.getenv('PATH'), "gpg")
> +
> +                gpg_cmd = "%s --no-use-agent --batch --yes -ab -u %s --passphrase-file '%s'" % \
> +                          (gpg_bin, pkgfeed_gpg_name, pkgfeed_gpg_pass)
> +
> +

I think you can combine this block with the "if gpg_cmd:" one below (move this
logic to the bottom and combine it with the content of the if gpg_cmd block)

          if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
>              open(os.path.join(self.deploy_dir, "Packages"), "w").close()
>  
>          index_cmds = []
> +        index_sign_files = []
>          for arch_var in arch_vars:
>              archs = self.d.getVar(arch_var, True)
>              if archs is None:
> @@ -196,6 +211,8 @@ class OpkgIndexer(Indexer):
>                  index_cmds.append('%s -r %s -p %s -m %s' %
>                                    (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
>  
> +                index_sign_files.append(pkgs_file)
> +
>          if len(index_cmds) == 0:
>              bb.note("There are no packages in %s!" % self.deploy_dir)
>              return
> @@ -206,7 +223,11 @@ class OpkgIndexer(Indexer):
>          if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>              raise NotImplementedError('Package feed signing not implementd for ipk')

Not need anymore

> -
> +        if gpg_cmd:
> +            for f in index_sign_files:
> +                result = oe.utils.multiprocess_exec([gpg_cmd + ' ' + f], create_index)
> +                if result:
> +                    bb.fatal('%s' % ('\n'.join(result)))
>  
>  class DpkgIndexer(Indexer):
>      def _create_configs(self):
> 

-- 
Cheers,

Alejandro

