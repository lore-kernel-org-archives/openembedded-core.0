Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 67125 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Nov 2015 16:00:28 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0146.outbound.protection.outlook.com [157.56.111.146])
	by mail.openembedded.org (Postfix) with ESMTP id B151E606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:00:28 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BL2PR04MB833.namprd04.prod.outlook.com (10.242.196.140) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Wed, 18 Nov 2015 16:00:27 +0000
Message-ID: <564CA097.1030703@ni.com>
Date: Wed, 18 Nov 2015 10:00:23 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
References: <e54ec1320521a08198512388736dbf21e832fe94.1447842013.git.adrian.ratiu@ni.com>
	<5725c294cf5d9fdb98cb5531f30f8f46e66a20fb.1447842013.git.adrian.ratiu@ni.com>
In-Reply-To: <5725c294cf5d9fdb98cb5531f30f8f46e66a20fb.1447842013.git.adrian.ratiu@ni.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: BLUPR0401CA0019.namprd04.prod.outlook.com (25.162.114.157)
	To BL2PR04MB833.namprd04.prod.outlook.com (10.242.196.140)
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	2:Msv2bhtWy5LL9lhIR3qkvpRhU6P1NYrSeAADQJ1ik1gnVAgAoI5eP1O6ZXh17Pp0IXxvn0ZUqcgL+nrhg8Iq/oSi/SitNSF74Tx5QLRJKmnVWFQdx2zO1xe2h83f5fUxr3ZRrzjyPFZZudQZKL5JlSGaU+Tp8Z8up0cUx01NCEE=;
	3:PdIvMEQPw7zC85MfKRIwevAUy5Of2TM7VFfAmYthOxQQH7fy8ix46ZOArF1B/IPoKPcbp5C3OpLQwyj1aNPymLNYHH9HJTH90SxWdbyP0xhAXODkDdmvjvFUANUXujOKAZKWoHMEixSkrO+WDsotfQ==;
	25:KS/y+kEAS1esf8YdB9o8/E0tthmqSTS7cStzTADalKoWJXMoIOBmyl/MXGCgAzgURKRhv5CT4hnV7bY4hJgOpyEOxn1Si5D8nTK10jlRPKL3D/pYEvq12seP7uznW0RBTXYvC99muef3w2LpmWWJJEm+Htqf+XeXcT6wkIEK5MR0KKti99VFF7bmLW9AfGMWY7c4nhcz9NWwDgPyu+Zxrn2jUTSlnwbqkqEfJWbmAeDaNFwY5HeT6jTmiFmusNC9RilXsuBoyfOiqgSdzPGpUg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB833;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	20:PxfmMj8zAge/90PEOpmArWxk5Ylk86yEUldAMO7WMdjtaIUg4sHm8HhAMMnnu2RKoRL2CoP6UtAhxtshfoTDlrKaSdsJOmppsKqSd4fVeTOAfvZ9+wnJg/fW+wA0T6540hLgR+794NI4nJLQziRfrv3sOtCDrGTCeYjcehDKk2+07Gl6nje7GITltR1FdSthJxNxnysN2i/aWXj4cuBMp+b+wV/A64wxFo2eSdMG9Riy008qOof8gjU/IoQp16K6E8yooWgNOfSBejpu7RRv+6G9k2PYd7Klac0Is7vH9ZEyooLOakXmL4Q+ZRCOBX0stCOm/KfZJlmPkZFlG6WmVZ/hdwZ0DZu5JmQHKbpY2amiJU7rntW6eeqFOkA9/l9ZCx3h0l4RtkuXuOou9o1kgKCKLXl4NhJDxkpA7sPSAMqyP7GCNNx7DE/lmyFMjDAJ3wirB7sweDnRtNtL72c5YtCduCVgD20gizu5kUQFD0N/twW1UrCFUEZaay7HdJtjfCvyBteDrm1nF/lRTS4qp9CsJjLDyJUsEWxRZOiyoApIQvzZYW0GNxgSbs7OL7nl1QOsUwTS6bSB5bta552Wt12i4ZLgtZHlXGBKx1AINTs=
X-Microsoft-Antispam-PRVS: <BL2PR04MB833C4D832F1ACFC2E7A1C87861C0@BL2PR04MB833.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BL2PR04MB833; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB833; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	4:Nr5erhvqUcAO+MoMPjuzL2dppx3WHCPIymXh5hwfo8V7IbJTZrF8ajh8RvwC84LKGcGMM6Q+sy5ODCT7ZCbw6OCDHSC1Lt5v5wqAX7ey98OcLn9hd+EFM4DBy7AFTcXg2UlM6IHHnQ2TsZfkMa8VK3q+AlTD/NO11RbB+otdPTgNuXoEK2ttWVcAhtw95kIZJ6lQ2aBoSYjMfEiQi8wZCY8tk+NwGEAuyGukzUGza35NVEtds926z/HzOWzlIG4Lx9YZ4hIyOW5+cNEfLHxV3V8kfphDIz4503ZTEDZj/4bprGvVr25iSnCUmYocXb1EIKhxmApzrrMRl55y5rNyauZrbBmOj3AJ/sawtU7mHW/qe8ol9B78125dpN45IKSE
X-Forefront-PRVS: 0764C4A8CD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(24454002)(377454003)(189002)(479174004)(199003)(107886002)(5001960100002)(586003)(5001920100001)(92566002)(189998001)(5001770100001)(97736004)(81156007)(230700001)(87266999)(50466002)(5008740100001)(33656002)(59896002)(23746002)(64126003)(101416001)(77096005)(50986999)(65816999)(122386002)(76176999)(54356999)(5004730100002)(106356001)(19580405001)(105586002)(19580395003)(80316001)(4001350100001)(36756003)(5007970100001)(86362001)(66066001)(65806001)(40100003)(83506001)(450100001)(42186005)(87976001)(575784001)(47776003)(65956001)(2950100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB833; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BL2PR04MB833;
	23:u034+TWxJ4u+wTzmNr84Vu1KSLV4n01ibWXq0D?=
	=?Windows-1252?Q?YfEfiHQ5Sz4gb3kii/bR+agjF/dzQT7oDPdnijVaj0EDuq0Ak21niCsd?=
	=?Windows-1252?Q?1sIwRyTG+e+goQfaUupI4DMjO9rIfZjLwE/C2Z7kkGKkC24e4ulU3jnX?=
	=?Windows-1252?Q?TpViWBwjZZnraNuxBtGj6OTW48lwbs+WoKbhwQuSfQ4LZM1rd2wWIKJz?=
	=?Windows-1252?Q?BfBJu8ihhMKrNztHC3ZE+bUqQj3J4IowZoSkkx6xsyz9p5ignYEWiax2?=
	=?Windows-1252?Q?IsBvUSULFbC7B5h2L+iHqOyDW+Ds1pBBTwvNWApwUNc3M5+rDtKfNpvy?=
	=?Windows-1252?Q?rw81jqBE78/URMsy1bYxVITyQ7j72UfjfHaRK9QLkXTUcQA4kRCh9cYn?=
	=?Windows-1252?Q?cjzm4czPbuw2FBPS/aHB5wtY1HoaWnSMAXzn5x4ciQ8nwpTMharM0alN?=
	=?Windows-1252?Q?nze58iW4zNiIOn39wKTJErR7Tlwd25wx7Ni+WxITMxVUeJlLV9l/YBwW?=
	=?Windows-1252?Q?xk+pZxd6GthX27hQcTj32YweBO8kWT5Qx7LOwg86RsWokSD0vaeVCfOZ?=
	=?Windows-1252?Q?GKPnpBdUjyrvXAQE+o1/Sx3tcW2EhqHk3FkWTNbRHpppDdfLvA51LUEB?=
	=?Windows-1252?Q?ppwRxEiaCAfnGJkTWaDtH31Nf59qL8su5hhr0f9I9dv7ligwUYikDAgu?=
	=?Windows-1252?Q?PRDHmTnoPBqLsSJTGnAajh1l+buwBqXTIrSD+0nZLdNwBfktXqRiOiCk?=
	=?Windows-1252?Q?dUaR8/vhRFk6RKI7BxRRSi47p7oa2QopmJCRe4LXszayWs9JJVri96zK?=
	=?Windows-1252?Q?fhsYI/u/P2HpcwdY547rFojaggnUXdzGWOBgpPkHyA2By7l8aGjiGA40?=
	=?Windows-1252?Q?k+JzR0MhCx2vdSSlnSR67tvV93RtZkUkRDfPVrzarR53vJWvaoj24MS8?=
	=?Windows-1252?Q?5OrBeeg8cB4ya/MERk6Nzl5zY2M10cGv3I2XgXUwWZyuKZQERw/fdZI9?=
	=?Windows-1252?Q?njPip+uUuFvBQNKqHeblEU5FyjN/TbuhO1BzJU/VNad9VLmsryGDbyGx?=
	=?Windows-1252?Q?8E7FE359iCGec1AYE/I3pF3R1BbSW4TRyGXCXxZxMlw/7Y72g982ifQX?=
	=?Windows-1252?Q?E2dnT9iy6PK2DhqKAL07lHwh/sZhw1O/58NmHhvSXJRCvFc/QsWeMlP8?=
	=?Windows-1252?Q?a+2xH7mIg/lqe7urDay2PuVdCDRYPymf5/Y6FPnbPcUfmtscftWch0Ks?=
	=?Windows-1252?Q?0349eqiaOlaYe7iVeFNm/eeHy44DnR7bH1ECjS4oBeCytLOxToojWV0E?=
	=?Windows-1252?Q?+DJmn5VXhnNAV6LUBq/EwHXAaH0ZIuVFFNQzmMjIVoHXub5m+a0lk3M2?=
	=?Windows-1252?Q?Kx+o/IoG0cNpQm/YaQBhHLM5E5Swj5npy7Po0EqR/Mml+4JV23Sz90yZ?=
	=?Windows-1252?Q?1qcXQFN165FXAgkM2ciK9yIQZWip1WKq7nu0hCRvBu1H4+ysCZpUAqZU?=
	=?Windows-1252?Q?HZlfM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB833;
	5:f5CjCkut6W0JDNJ6CgOdNfZbTsluFDsN2C9sP4IbjG/hh20qsCv6UdxMXdtNmJouLvmzEEV4O07f29FRBPJdPY2+mrRTS2eMftivFhHzYr8ibOkZZ8xJMKGMQtHZZYSbQE6j+YYisv7bHB4pv4zUXw==;
	24:GKXgp6vQnafSnTKQa+MikyLQBN5boB/NpzGOqthHgA49YxzSvSklLeMB02e6ducq1MxilShQ9x4+dvKgpgYEIRFvoZZCuixzyUb49VBg29I=;
	20:5MbtPq2crhVqFcjKSje7q5AnAqrdZK1++teKoVx37VJ9AV0wkgC52XYlqRlDfxtbVZ1xRIAvHsorypt1thQro/oVbds8eBKUNCQnczBjC0EBK1Du17/BDzToSLHY2rLDr0BOPr+qHWxd0Nxu2W1OwKlIg3V7UZuB0UCfPOfj7f4=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2015 16:00:27.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB833
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
X-List-Received-Date: Wed, 18 Nov 2015 16:00:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 11/18/2015 04:25 AM, Ioan-Adrian Ratiu wrote:
> Create gpg signed package feeds if configured. Very similar to
> how rpm does it. Most of the config variables are shared with
> the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
> of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/lib/oe/package_manager.py | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 964fddc..a0fe0eb 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -178,6 +178,7 @@ class OpkgIndexer(Indexer):
>              open(os.path.join(self.deploy_dir, "Packages"), "w").close()
>  
>          index_cmds = []
> +        index_sign_files = []
>          for arch_var in arch_vars:
>              archs = self.d.getVar(arch_var, True)
>              if archs is None:
> @@ -196,6 +197,8 @@ class OpkgIndexer(Indexer):
>                  index_cmds.append('%s -r %s -p %s -m %s' %
>                                    (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
>  
> +                index_sign_files.append(pkgs_file)
> +
>          if len(index_cmds) == 0:
>              bb.note("There are no packages in %s!" % self.deploy_dir)
>              return
> @@ -206,7 +209,21 @@ class OpkgIndexer(Indexer):
>          if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>              raise NotImplementedError('Package feed signing not implementd for ipk')

Forgot to remove?

> -
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
> +                for f in index_sign_files:
> +                    result = oe.utils.multiprocess_exec([gpg_cmd + ' ' + f], create_index)
> +                    if result:
> +                        bb.fatal('%s' % ('\n'.join(result)))
>  
>  class DpkgIndexer(Indexer):
>      def _create_configs(self):
> 

This is the approach that I was suggesting, looks good.

-- 
Cheers,

Alejandro

