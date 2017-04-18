Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 3202 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Apr 2017 14:39:49 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0102.outbound.protection.outlook.com [104.47.33.102])
	by mail.openembedded.org (Postfix) with ESMTP id B21BA71C56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OAYqDj5a8rIGpzi7IfWaNqG8AmsEOFztMn9reEJATkM=;
	b=gJ0gagBMrzPia3XsF/qj3EEfG6+k1oZqUeoF5QtU1y+Nyac/dlGIP2zv9i+/tlMA0y+4UylSaMeiCExFi/KF6mjgXfur/a3jV6LK4JNi0e1JrB+SN2Gsdrws2t2bmhkjomAtlig+SUoA6E2IZv8/8cw5irktxyZPwjaeUic+mqs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-oi0-f41.google.com (209.85.218.41) by
	BN6PR11MB1668.namprd11.prod.outlook.com (10.172.24.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1034.10; Tue, 18 Apr 2017 14:25:38 +0000
Received: by mail-oi0-f41.google.com with SMTP id b187so179023354oif.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 07:25:38 -0700 (PDT)
X-Gm-Message-State: AN3rC/5yhVFT4wCBQ+UIUFX7Q8vHyjBKqyUUlN7Q27T2zpqrdTOwzLq0
	APkcELw4F6Eek58nSYOP+vibP/z9lw==
X-Received: by 10.157.36.107 with SMTP id p98mr8724455ota.240.1492525534761;
	Tue, 18 Apr 2017 07:25:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.111.9 with HTTP; Tue, 18 Apr 2017 07:25:34 -0700 (PDT)
In-Reply-To: <CAJTo0LbOKpaYit0Zmex3QcPJfA5rC9WjkS0=X4xZzyZwBDo8cQ@mail.gmail.com>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
	<1492521609-26624-9-git-send-email-ferlandm@amotus.ca>
	<CAJTo0LbOKpaYit0Zmex3QcPJfA5rC9WjkS0=X4xZzyZwBDo8cQ@mail.gmail.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Tue, 18 Apr 2017 10:25:34 -0400
X-Gmail-Original-Message-ID: <CAMRMzCB5wmpduzu6O8DYthLp2jSC0Whi0K42fOveh3y=cj_c+Q@mail.gmail.com>
Message-ID: <CAMRMzCB5wmpduzu6O8DYthLp2jSC0Whi0K42fOveh3y=cj_c+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Originating-IP: [209.85.218.41]
X-ClientProxiedBy: MWHPR2201CA0054.namprd22.prod.outlook.com (10.172.59.28) To
	BN6PR11MB1668.namprd11.prod.outlook.com (10.172.24.17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81a97ab-a3fd-4339-6fb4-08d48666c929
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:BN6PR11MB1668; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1668;
	3:cBAdEz9VkqgeoO00apBvm1bDbTYQAZRlpVFVcLQ2RtFnZri9ScthMCFyp6yhyGReDOsJQjWSsYZL2jCWWlh/7X6ilUjxS+sdXDsuti6kYGoRk2kq6aT0ZCtXi23uWMpiUwS9gRCc7n8FyuPVffazxemTpiYqgmMptNUK+LY+U7FXXMUkoN0chM1QEq4ysVX7TUpGFJl7W8kjbV6dINCfaeATzLb3hT+lsop3fqUOT6XOS8F7sTppm8X5ogPZtLpZSc5MudRoc98z1WH+3q26nZQR4E9kzywieZpfitDdTiOSee0VUwK6vSqYQtEMEBS7;
	25:1s7JLaqnxnrtxUWSPJ17c+tMw6Mk2qbN1MctjeWqzcLRfqXyZlUU3VguH2LJJ0JJ9pUsm0wXgx0CvJGXlaYwlApiNznM/0bGYSvpCua4E/JtrqnCdnUG88vlrj8VquRQy75vfklg8JaBJojaZsxP4McfTXvSZobelIIM1mQO15ZTrvWJ9SPwvqcoNZNtxXRC7GLdMV4gLpmxICY2Hm+BD00NiL1qUFrb70rKdssKcbCyVy1BIeDeRMAIYOw5LwLkTZtYp6JCmxG9y6Lgued/sja3YABZOOewk97vwVAXwG6bk7Je9AfFzga9p8uR9cxuKMp2jTFL8IqEWZO8LxWm5dFa0p+ugi6IuU7XBG7L33FjHW9YyRHMiWTC2tp49Qvqkf2vdp1dOLJRaYj/g9B2reLbYm4KcbndMXi12rE9T/BGph/7HYwn9B+EmxAg11SE6eg1TrbN5+sKA8wZyMMkYw==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1668;
	31:Jgfzpii0AUWFb63Ck30qpWrsHgJ2dWffdr/hfXDI8MsysiPur8Jb9ahgrC6OG6ypEZdKDz0U151nEWkN6GefqA+4d250qTgLWKSYtGa39hLEIWFCK4TUOr4e4d+xRyOzvw73ybsmvgnoW8keHjfG/GM9nLAfkfX5G3+NEj6QFSst5GgRNf3Oiyoffcltb7FpUAlM75UVudc4SLYpZiJlkVYk47f5qjPpTVZvWqYcQz60IS5LOB61qbSmGvyu7xHttkfY6NlBCORWu4S1rqq4swmDdVsAnyn2xPPYWEQSAF0=
X-Microsoft-Antispam-PRVS: <BN6PR11MB16682E19AC70FA1DF6E2EA48DC190@BN6PR11MB1668.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(2016111802025)(20161123555025)(6072148)(6043046);
	SRVR:BN6PR11MB1668; BCL:0; PCL:0; RULEID:; SRVR:BN6PR11MB1668; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1668;
	4:vzfnDdZbMbVVE7luI8oje0HE4LXqdEU/y2pMa4Rd3TdVdnVX38HgqINT80baW8qhi6GTWIz8L0YlSAVANCDgVcwbftyB+p7FyYbubeus7oX0KQ4+eMacr7asbGX4a2TGtruipngBxETzTDlhBNgTdEt9VJTByvD8SDvgA94JxV1ghEc5WGmDNfrBybqlTvfpeyRgK2NyLO/I6ZmhgNIVnVy/OojZ8VRJSpqGRHo0MtkQdpIrm1LA5xZbpyUD3oxIWx3WorTtovj+zzqMOvqZcRYYMpPiD0VQY23v6iJiqyoj9UedMQfInxpli1ldaGDQ5YaKmxgiYTTrRICkdahBcnN3AIo37ifcAOMKh6TTNZQNdtYu/aqTiaMxOUAHsCoDFJxmwPjcjfPihAA6FkBd5qEc+AU4urGzTfRih1LqhOJbiJo9OD4PY/wm7LzjhLvcZL3FBeB3ZFvbcZB51T2/g65j27MOvWbmaGM0oYnSRPQUoTSYj8S/zxjRgMEHVppJ1UzGSGXMYHwrpJR+ZSt12K5qEMOolw10bKvULNMmIqEbXXUckBNwz5ddNxHzkZmWreYMan6ZBigyxlXKzaltTdcrUbtuyzB0dNmEFET+cktowhT4jh1VIFnma16c/PwLrOyvgbdXY6ZX6wDGOLMh37gAUtnwRo0fzWropFzhKOi3KeGaeupftr6MFIKLVs7kgMK3VF4x5i06sGcv6ntv3bDjaggLAHcCyYldb+JGOtWGxtyjjPz6wYLBVjTL5oVEFgiq35l67s/1yJghhJERKS2Alui06dFjZzm8W5fAUopM3Hae2R2Bi8XKeRjqUqoc
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39400400002)(39830400002)(39410400002)(39450400003)(24454002)(377454003)(76176999)(98316002)(53546009)(84326002)(512874002)(236005)(93516999)(53936002)(110136004)(498394004)(189998001)(59536001)(229853002)(81166006)(54356999)(61726006)(6116002)(50986999)(63696999)(9686003)(8676002)(2950100002)(6862004)(38730400002)(86362001)(5660300001)(55446002)(3846002)(4326008)(6246003)(66066001)(2906002)(305945005)(42186005)(7736002)(61266001)(74482002)(9896002)(8576002)(5000100001)(55456009)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1668;
	H:mail-oi0-f41.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR11MB1668;
	23:VF1yX07jNB1ILkxhEB533neECcizQvnoHIOq2nDZW?=
	=?us-ascii?Q?9BeYg+Z4jTtDABGFSyGFletL/JmY8Ger3B11B2VW8nRaqW6XeG5nMptqueXv?=
	=?us-ascii?Q?nJxv6o+6z6SMQngjHbjoqnDPv17R1+M98HDVOVC346j+fM33kOvIHU58TBfl?=
	=?us-ascii?Q?R1uQW2RG6jxBGKUVLnGEqxORxgKpXILBu70nQ39jbUGLfR6BK2YBveQiwadc?=
	=?us-ascii?Q?Qpg1McKy5JlhwEQvd2SXi9VyLVkAfy07ivHqvZEmlHWIAsWBaU5Os0W7Jkpo?=
	=?us-ascii?Q?PLkAnHGn5I2CgTaUlTXxsvTtuNv/Xyaiyfn709xsB01BW1yfQmyg9ho+oFPu?=
	=?us-ascii?Q?kTSBUzXfKCiKTZ+nD9YO3yOd1eOIMsaqUU6/+nrHtmqKf+/UOkLoeN2mbNBc?=
	=?us-ascii?Q?65f4RKoKRprN2I1/FSMLukkd/zLAyfqFSiXySq4eSdG9w9jr79H8aYwI6HYD?=
	=?us-ascii?Q?LLyEpbNUH3xY5J7PtHhhzl5tfrF6p4AtjC3RnhPnQWf3uOYjBsPun80AG8j4?=
	=?us-ascii?Q?35INb+G7tol8xJtkYpqTd8f6bSbwxYGLpkOPDHOpmxCwmEK6wP7y/eCbVyIe?=
	=?us-ascii?Q?TAGE1SEUnxzk7AB4Lfc7jAIXecSchP4peDKcGoa6OHMn1sGdYEjMt6CAEnx+?=
	=?us-ascii?Q?en1RCMgTmFRtU3gEzP+I5W97aocQJOWQ1BvRyeqTeJBzq/Nrakpq0uy+/wUP?=
	=?us-ascii?Q?dvPQiqDtj7Z0TQgN9kdfpIN/8CtHPM4fWUqWVt9+zIJ6V2qdVsDCqfvyQXwJ?=
	=?us-ascii?Q?3VMjuXSeIhUk+gZiAC4aSuSW7KMgh0Ydso+gjPbkGRvOUASnknJN4KaNlIOo?=
	=?us-ascii?Q?ggJVczbcYsGM7jGDsPhBhTtZLpsMxBZjBlawADvWn8BZlcGfZ3n0IwkD6zP6?=
	=?us-ascii?Q?7xTnU4uH4vv58rZfbRgSgfKcwp1ICf7tySz71roWA0LJ3NWAS9eBKZega31b?=
	=?us-ascii?Q?aKeOdKfCNfObEmdMbJXoZYULmlo64/7xSmRBbAGN0V2Tkv5tM+N/DLaGfA0L?=
	=?us-ascii?Q?wQTy0vhE64uuq9MuyfVhA2CupPcsmrXQAS6MoFGoa4VBPKJA7fAxRo7cL7Bg?=
	=?us-ascii?Q?125VJQ2uhfRXkKDXwYTnlScTFH9xT407nvpb1VwWCRRAzPhgZV/wjRBmTYxD?=
	=?us-ascii?Q?j/M4IVu30QYnfBsBldunw125xyrNiJNcbrGBWLoewlJO4+1/ax5McGd3WuYZ?=
	=?us-ascii?Q?/fetUeECWhzS/iiqB9X5vX1hiO/JgombTTJqpfnMV/KjpZNXs/RQuT4kg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1668;
	6:1HncEv2manQCbXQKycc8HpjRsG/XEBWvUo1BPxgdChcOPBZU3xbuXgZUAUk9MdDLe5OmgR3PcCzfe3MjGiRebCVNwbKzvFyadsQYARPbjd0FsY2EmqLQjzSemf3fSvIVzV8b9zxq6UnNDLYCOU8E/Y1abVdSiRilYT1I9dIPi19R6OqhpVNVStk2ccAWdft9sdb4KAsba7ohdX7s06bzGIVl5vseRgJ4TaZ1KGMZKvWAOR+LnCgVON3wRZa0tQpYz/enl/feVqZOqVyrqZ4oswSaLwUzgiWLf3z9MXmo7+ISL61BI9Wc9hhzcgtz54p2IQ1qTcN1Y8dkauS66lFaAVaUaeAUPhVlnM1yTYNn+hXeRPvS73baone+9kt/mt79uQasKF+zEtha07LHTvXY0pxhgb9mbWoHSrq0dfyg6uG6mAp0Vn47Hn9hFcqzRCqqbqWoO7vxArYst3DrUoqrbA==;
	5:4UX8FBFTdXpqQbV2EWLD0i8PDTrPBHCoddieoqf0P+NFbScD98JTLVrHFaZZXFBIE1reCiwczeEfzCiRGN68d+65Z+IwF82PNx0j6f4gHjKNVQD4bcAsS+2ftHShCDk3WfpQbKcXFyFG9nSKmas8vQ==;
	24:flJCFMgIQlGrsH4p8FqDPDYRfsyT0YZsoAorMPVplt446jfwU90M2G1WoegfgYVSFQZXgWUIkCJIswIjVwASwZ3B2UpB7GV7ojR/tuyseBw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1668;
	7:FGhdPTVy4UShAdDCmTBBuoQ6DDIqymVR9/TuEiEzPwU8y7mjp+BJdLq/BA1NaiOxwIEhgj9POCngMYV8mWdQbCj6bPNZ0FsPANPRV3FVJ7DkYc9ySLAd8FKPo2IqoFNKPFJY7KsMXqabYp3wYX2kVkyxqaJNSgooS3waWgoiVUCkKNdc4zIXX/R0jZcWu7FZ+OrejUB4ZVCRbUGHnQizggcxDyfbOAzgqgSzvzdzOo8Bg7oPQGFSxvpgdYOgXkSSvGs+zWeMJX/t9pf0Zge+8AT4gQ0/uu9eY4xBiD+4cYXF3tajQC4EKPWg9s42Pg5jjCgMXPs8qWI8/F5LABhKGg==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2017 14:25:38.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1668
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 8/8] bluez5: rename "readline" config option to "client"
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
X-List-Received-Date: Tue, 18 Apr 2017 14:39:50 -0000
Content-Type: multipart/alternative; boundary="001a113cf5ec515c22054d71ae83"

--001a113cf5ec515c22054d71ae83
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 18, 2017 at 10:14 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 18 April 2017 at 14:20, Marc Ferland <ferlandm@amotus.ca> wrote:
>
>> The configure option is "enable-client" not "enable-readline" (the
>> latter does exists and is automatically enabled when enable-client is
>> passed).
>>
>
> The point of this was to remove dependencies on the GPLv3 readline
> library, so this explicitly is readline-using-clients not all clients.
>
> Ross
>

Did not see that, will fix in next version.

--001a113cf5ec515c22054d71ae83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Apr 18, 2017 at 10:14 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 18 =
April 2017 at 14:20, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"mailto:f=
erlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D"m_-9123040101333657330:35s"=
 class=3D"m_-9123040101333657330a3s m_-9123040101333657330aXjCH m_-91230401=
01333657330m15b813a3c12ea62d">The configure option is &quot;enable-client&q=
uot; not &quot;enable-readline&quot; (the<br>
latter does exists and is automatically enabled when enable-client is<br>
passed).<br></div></blockquote></div><br></span>The point of this was to re=
move dependencies on the GPLv3 readline library, so this explicitly is read=
line-using-clients not all clients.</div><span class=3D"HOEnZb"><font color=
=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></font></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">Did not see that, w=
ill fix in next version.<br></div></div>

--001a113cf5ec515c22054d71ae83--
