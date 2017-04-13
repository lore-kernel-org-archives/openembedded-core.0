Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 8174 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Apr 2017 16:05:18 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0130.outbound.protection.outlook.com [104.47.40.130])
	by mail.openembedded.org (Postfix) with ESMTP id 0258477E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GbcKKd3o1OC2uKUagN9Y64/z++eCchAadB0UOh9SAWA=;
	b=PmkDL/64iAzQHvD1o42IwJ1TnYpZ882pgEMJv0Tkx/26hdZAiLB/lqYIkGYV9/ZW5BtQTfmgop+cIz/O6S3G9EtsBMnff1jSFpB1sqnbchFTON3nTsBQwN6SM9muPffkGGpPRH66IZCqP2OuWXfT5RbVdlpvIA+0jeKq65j5/iY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-oi0-f41.google.com (209.85.218.41) by
	MWHPR11MB1679.namprd11.prod.outlook.com (10.172.55.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Thu, 13 Apr 2017 13:34:28 +0000
Received: by mail-oi0-f41.google.com with SMTP id b187so65377108oif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:34:27 -0700 (PDT)
X-Gm-Message-State: AN3rC/5y1xXUug8YXDC9/xCHozrs10XRzrtCzVfYVY+Yo+kFNwQ/FlRZ
	jMH84hDx2bRTKxyauDt6YDPOYUbDQQ==
X-Received: by 10.157.54.204 with SMTP id s12mr1762891otd.240.1492090464513;
	Thu, 13 Apr 2017 06:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.111.9 with HTTP; Thu, 13 Apr 2017 06:34:23 -0700 (PDT)
In-Reply-To: <f5feaa9b-6105-1f9a-6758-05a1fbac0746@felipetonello.com>
References: <1491850956-12248-1-git-send-email-ferlandm@amotus.ca>
	<f5feaa9b-6105-1f9a-6758-05a1fbac0746@felipetonello.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Thu, 13 Apr 2017 09:34:23 -0400
X-Gmail-Original-Message-ID: <CAMRMzCA25Fy2-9s_yPTGRBEnRBsNTB+WQow6PLX7-xSOe+XboA@mail.gmail.com>
Message-ID: <CAMRMzCA25Fy2-9s_yPTGRBEnRBsNTB+WQow6PLX7-xSOe+XboA@mail.gmail.com>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
X-Originating-IP: [209.85.218.41]
X-ClientProxiedBy: DM5PR18CA0044.namprd18.prod.outlook.com (10.173.208.30) To
	MWHPR11MB1679.namprd11.prod.outlook.com (10.172.55.20)
X-MS-Office365-Filtering-Correlation-Id: 5848c2ce-62cd-4e4f-ec1e-08d48271cf03
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:MWHPR11MB1679; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	3:Gc4oCvVskPh+c2vXeHzdTHb/sGFpP+zpaSqTHvWGatWi1E1f+/rArwWrM0KxNKtFuPQNQGh9prU0UTicXjRj6T9CggBS6icv4Ha0SXVZAtatOCf3DYOuJLbKe2xSnK7cGpTFW9zMH8S8gK7IGg6J2hJ7rBrVswuYS+4Ta1qhpaQgaxQAdhHzy5+RRgeTO+iUC00NQhEfswwsxtXsSenoIbztEx/6PoqATsAMr0gyuS4VkWdZFGmF9DqY+uPjOhzORXHRiA8ZA5BE/EoHwGAHDgEwDrJP+qlB7ceb20ol+O5lTund3JWDQ0xF6gSgNDQg;
	25:suPQ/9g2j2saE78qtSIyE/RG/6Dlf9dnNJWfxD1kt+aWXxPoqAFjC8AxwWZyQcdXRPtiN5o56BsAC23gTBeDFtFsBEIuIQxIKSjxl/8+i5vgKmp4XOzOaPSqMJnkIyBLm7svNc2/Zbgomb5cO4Wjq9MX3AMf+C4sP2UHQzZlnNAJUbYSlL3zYME22OALVKvnrzpFkUJnKSyypd0d2DSBU7xxPF2Zu5Fhavn7gapOQ7x50hCyyip1jIdh71tgM0MF2dlhP4NKserWkYKp5zJzrrqcQd9x5psamKEUFjZClW4xgXPEvIjwr8Mda8yITxnR17YTj8y3p5hB7tsKh8gg3rulOdFGbaWnuGTVtBzlOkUb6jgErpuIYAIGB+Ff3lglTRnXb5WYJt4FMxiWw9SIMQf8wQBTZ56Wro5qJnxMpyOQd9VlWvYdOYjIpGrS0jE1IJgZvKtkJceOrnk2aPnmDg==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	31:HHNzwa8le8jVwhTjTp4gNblO/JRsV6pMBxZ0wF0mVovmY8x1BeaCoPDGpB8e9e5sR8ajvt+8gCJZ8m/p3JBDxo49gidlanTkQeDSchYUbnTdgHoC3Pp9mY84g0hViRXPmLxMB4gzabizLXCsE9Yt388KuIrOVyHXiLo+ZOr1Sh+yNfN3H5pm7dx758KaNZkr8cUP6euODEhJZ8fFB+SjBprMMckmtBrpczCL9xEbyYvtaR4dUBOkllCxDZ2XAGCzmUQUlvzhaEjhueq42913HQ==
X-Microsoft-Antispam-PRVS: <MWHPR11MB167992A6CD977D9707B451FADC020@MWHPR11MB1679.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123564025)(20161123555025)(2016111802025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(6043046)(6072148);
	SRVR:MWHPR11MB1679; BCL:0; PCL:0; RULEID:; SRVR:MWHPR11MB1679; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	4:1bsogZRP4R12Qz7oLGLRb2NGzhhLJpyyWgaIF6Jvn9wpR5+bf5+9xuA4fmFoMncbyCWlUAqtMHvaDQMVHbty9ezoZa0CoVUfMvSGtOhniu0qpU/PrLJPnTQIz8ZPlEM8cs0xc84M7Xa9/3+lFDgYqYMrXwRdZcyVhv5xV4l2/EarQT188NE0LuEgQDHSYGP4yDUji1HljFiNHJoSgt6ZamtuQ95ykx3k1fYbVT+4UD8ywBnRUja+jnYQbyxusMG2ong1FOrU5VTxQOY1iOZiw+fRwelnDQLPdTqa3R/xUHsgUX/01RYU1bOryA9bKhQl1fVgUA+BVsp660XijYaBvu8PE1sxmjYfQ4o5aV4a8yjadS7J+knAPV6aMZkZOfjejAwH94HMPNecY8AGakydU19L0VdDOG7CoC6GXebbiUTEAg+1jsu5uP6v0sWVnP0DviQ+AE5pUMTfsU/A9Yh7xsrMU88k1x71wJWQXKQ+tg0f5UgBf6p2BrCzUSnCuCc5j55SJYy+fwC6GciyVXWbC9GUdbCjg0X2HE7XEoLol0SBcSgoV7c9eT+VbPQYAtx93TfTIer8MEJMYnhfOcYzH6BftgZINIY/NiddzxQH8ClWwrFgQeg5nyEwV5ghtbJPhbbwfIFWNlsfRbJYuM9GZj/tvqazl+xLgr/RXY175USget3j/RtbozznXvEJDGEqD6Eh79mge9VFhm5FFwZwICHkKwutJtQVrjsDhu+lkQaeAZPLJrtrq6rrBXGcxBlz4+LUbXhgSO1ukV+FM4sN0A==
X-Forefront-PRVS: 02760F0D1C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39450400003)(39400400002)(39410400002)(39830400002)(24454002)(377454003)(6246003)(53936002)(4326008)(236005)(9896002)(2906002)(53546009)(42186005)(66066001)(498394004)(6862004)(59536001)(55446002)(3846002)(5660300001)(9686003)(93516999)(305945005)(84326002)(189998001)(63696999)(50986999)(76176999)(61726006)(2950100002)(54356999)(81166006)(512874002)(8576002)(74482002)(86362001)(38730400002)(8676002)(110136004)(6116002)(7736002)(229853002)(55456009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR11MB1679;
	H:mail-oi0-f41.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR11MB1679;
	23:MZPZnr82uwxF8wsv63yz9qiiENlPcYFKI1D1ixXoa?=
	=?us-ascii?Q?ebqgLK+PGt4dmCJgHN8IaeY2wSi1H83yOaQbF5/KNMZwizsAZBBLKtZPY1aQ?=
	=?us-ascii?Q?5yFFAzX395lgoEAU4lDJaFKMNCqkahNfE+zRbBDCcR3WC4ZfwyykqD+jZE+L?=
	=?us-ascii?Q?u9Rs02bb+hFpFZAIaHbelsBW0kxRrfY7dgGpd/NwoWXpBcj9HrkOpM83SmFR?=
	=?us-ascii?Q?VEk4VQABXu5zNv6cRskRmdBdf8VJW7lHStAUvRa/P5hkTGE3ovoNQPsA3fYn?=
	=?us-ascii?Q?bE0UwShHRJXDDbpD+L5Upkfe/9PQ8tcdE2v9F/bggIO3I8aY1DkoJrGfwNhi?=
	=?us-ascii?Q?E2DiLMqg5uI5axe0sXL1sEcy6rgVXdKnQJZfo9XVDECPKegAes4YfOb0hMsy?=
	=?us-ascii?Q?72liAn65QYYK4C6fLy7xh4uO9qQ3r5RGUzMXSohjugO789XoKxFuhpBSAlzZ?=
	=?us-ascii?Q?5hfT4I6yPZ99c9R9Ej80wCddfUw2SHd8ww04v07wIJnkaxycT10c4wt6QZyT?=
	=?us-ascii?Q?8CSwLKVdd/7TPDf7Kgtuv84Qsqlrwwu3/99bEjCNc6AJRW05KtHinzZe7cTy?=
	=?us-ascii?Q?HnIpeDvnZheVI8kOUXGYCj8CE27yex/E0bUdio5+VgMVQklVnhGmRIqw7bAZ?=
	=?us-ascii?Q?l1vtWXneaQQO/7/DDdGQYg506d+ht4rtKKhbSLSQ+zhPdgDBMquNlzwM75Pc?=
	=?us-ascii?Q?ZqekodWAUZua/HFD84I4ADJ8iCuts1pA4faLrTH2GlUrwvSTHAecOxHbNek8?=
	=?us-ascii?Q?Ce80hnHCoycVqJgTeIJbT10Rwc910vpI9av5E3inFZtKT8vyxRmpZbFZb5Ox?=
	=?us-ascii?Q?1x59cGyGdrXsZLTdJzGzydhBntOQFjwtceM9qNa9ZDRjuMdVwsSEMwSswv0G?=
	=?us-ascii?Q?xp/aRUOkAr1xbCR4Kd/YRY05s4B6JaBn0pHqdqoxGRL/KGtSiWNg6sw97GYY?=
	=?us-ascii?Q?KSS0YG/pxjACYwudhF/yA8Vljcf5ibWENokbqqf+6NmqzVZvR6eufPvcQRKN?=
	=?us-ascii?Q?cC6R/s/fdPSn5iTMYvTC07xSnYnDZ/YUq7w20XFG6qjYwyEatTsHct1irems?=
	=?us-ascii?Q?zg+uECndQpBLfliGdySGAdhtYzfJWzl5QaUrVaeI+n/MoX230SdwyxOFFIlC?=
	=?us-ascii?Q?TczMcp8FXM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	6:4m9V+fg2SxLha0dcauFJ73q2CVwRjlPazvqdd91qMoRwU1nq/O0CHrYTvO1neAepRXngw6l2diB9g4LvZXmeFtckCL1SNHpRCRlJr2AZhqtc5j6P5PQSswHFakWiorGC5C5+Quxu1npC+D1DnPVafYjPfxXLMalaxAdCbwgO2l7KcVxLl9TGGD7viK8nFayWzs52uTLvk42dvBj1Ce/ivsu3q68bGGcyTKRWHyd2CgsiJfO56TfdKfTfO4JFmqhnKB7NJJ/f9/bwcni++VsgKFiwgZBD9WWY+LbsxP379CCZQASwsUGZSuboq4pXgMqKb9M8qEGlSAqCzK0TdW5NGstRzNSgpxVCzajF6DyOEEpcDTZeEb6R3Fcxyv9zQ6ISYRG9H7+Oy2MNcR2Jkbi+XMWRPFg6BlK5PrKgAaMeMkJUdEK11cag7FYI+mQScnPzVc06pC9TUf+ShBgww7a7VQ==;
	5:0tW4C457ATeUL4VKRXN5a5XSWxFXKpUNw+IbDwj7j/ULrwIDyE1n5hSCKT3s93ACLUVN4Y9KTDZHKNvmoq7fMaBzXrL9gDkZXHnwN+/qd0d26eXMRQxMQ5cy82gqs+dJFp3S9YnZ1xR9iJTUejoY5fC9ctTA+E0Ka6R/5hZSDA8=;
	24:XOLsopknkyt7yehy0uc6Ugb/X7QKnux6icpred3vB6dT7OA+Bua/xLueUVJQLHcuOLOVLj4Ldsdn/6f9tZoW5Ms2V4Z+VQ2PnENUKquU7+U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	7:Xjcc5kJe6i6OvKpXgrsEp/Yk51lb/RIxrv9/J1pJK3+kpozq1MK+DE9Up62pe0QeK1RN2Y8iO07ah0KewFXep+DU9t8kXfUtxdyee8eQhz5sC9a0iDaJYpjBvhJVdKNleQl6jWa++/B1O0c/Tq81yDG0TS4WM3Tfhh92dlJEC5dXmN4C1Zw4FHHXVXzkztC5y7CaxE0akv80hIXJ2y6MIJgABz0GJuXEltOjfQnYU17WwIX+huSJLrb6/34dA9hIbIW/Hw2a8EvX16QBZs53KpGSoRjB1xP1iQAqvCDfifqEkUGwc2V+0SliQ1b4oYSfcnuNuoA/+6XSVOhypPbweQ==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2017 13:34:28.2128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1679
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez5: Upgrade 5.43 -> 5.44
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
X-List-Received-Date: Thu, 13 Apr 2017 16:05:19 -0000
Content-Type: multipart/alternative; boundary="001a11417fb21c3b9d054d0c623d"

--001a11417fb21c3b9d054d0c623d
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 13, 2017 at 9:22 AM, Felipe Ferreri Tonello <
eu@felipetonello.com> wrote:

> Hi Marc,
>
> On 10/04/17 20:02, Marc Ferland wrote:
> > Mostly fixes to BLE.
> >
> > Also in this commit:
> >
> > - Experimental tools are no longer experimental and are part of the
> >   official tools.
> > - Experimental was renamed to "testing" (hence the addition of the
> >   "testing" pacakge config option).
> > - Classic command line tools like hciattach, hciconfig are now enabled
> >   by the "--enable-deprecated" configure option (enabled by default for
> >   backward compatibility).
>
> You could enable the new MIDI functionality as well, or at least allow
> easy bbappends to it, perhaps a new PACKAGECONFIG[midi] since it adds
> alsa-lib dependency to it.
>
> Already have a patch exactly for this, just didn't have time to send it
yet.
Marc

--001a11417fb21c3b9d054d0c623d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Apr 13, 2017 at 9:22 AM, Felipe Ferreri Tonello <span dir=3D"ltr">&lt;<=
a href=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Marc,<br>
<span class=3D""><br>
On 10/04/17 20:02, Marc Ferland wrote:<br>
&gt; Mostly fixes to BLE.<br>
&gt;<br>
&gt; Also in this commit:<br>
&gt;<br>
&gt; - Experimental tools are no longer experimental and are part of the<br=
>
&gt;=C2=A0 =C2=A0official tools.<br>
&gt; - Experimental was renamed to &quot;testing&quot; (hence the addition =
of the<br>
&gt;=C2=A0 =C2=A0&quot;testing&quot; pacakge config option).<br>
&gt; - Classic command line tools like hciattach, hciconfig are now enabled=
<br>
&gt;=C2=A0 =C2=A0by the &quot;--enable-deprecated&quot; configure option (e=
nabled by default for<br>
&gt;=C2=A0 =C2=A0backward compatibility).<br>
<br>
</span>You could enable the new MIDI functionality as well, or at least all=
ow<br>
easy bbappends to it, perhaps a new PACKAGECONFIG[midi] since it adds<br>
alsa-lib dependency to it.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>A=
lready have a patch exactly for this, just didn&#39;t have time to send it =
yet.<br></div><div>Marc <br></div></div></div></div>

--001a11417fb21c3b9d054d0c623d--
