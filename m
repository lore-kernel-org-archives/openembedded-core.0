Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9BDD77E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:43:58 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id c16so5140330itc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CQypojZl6cw6DqA3xQz5Yk8x2USm4VPQpAB/XkHZSHY=;
	b=j5m6HGSLo/Tq6QjdkVx4/kuZy0NSaok7V8LC96Cl/vsVpTCqVW6/0RyHP6A9+WV8Jh
	wqPGQe9UZ3JCkkcH2o30CvUAO4rDTP/MDzhmgyV9TOdyizxB22m5ULZQNJ/L8SUXO6c4
	8Lg7dxEh2WWrVMGMqCB0E3isQ1nqlS+ZAep5nYa8tsLcjFIvU4RDr8UZJGJvPilXEiKW
	rsfhgbZ9CLpCGnIjr99uTAU8IVsomSXTDNbMP85yx0rbeEJP1EutbH3ypPrvAejuS8Ja
	zlOTOvXJ460fi5Rt5yAK1xjTHMrOZy5RXoIPrXSHc4uAHGwcLlJPY3CERCxigi52iAuT
	RJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CQypojZl6cw6DqA3xQz5Yk8x2USm4VPQpAB/XkHZSHY=;
	b=MEMZx4X52EWMfWYiF4af+OTijgfofQtGVVmcrP2qQ/h6/2j+yNGJ+MYW7mL7LAuRzk
	IgZr3Jae0TrPFsuBB6ED7p5olrDHs0LfosXX7jdcy/umDOED2sVYo6FRLHD+LbrWIITx
	50teZ3fNbi33myY/kOv04BLRhli35fW4wlzNeLTcve+3QogyaucO0/0WgnOpw26jCXyV
	vWh9IktBMJQV4CtdfPPnmeuKYuCH4A6rQwHMbhcmCFDFKTnelFRMKjbADrIbk8oOn9oi
	SNhp2XDQ/CSTFP58K+0WBC1v8ozWPsblaLckyeO1CtLzLhtjXZ8fS3oVt6erTVv2MPtR
	yzyg==
X-Gm-Message-State: AKGB3mLccmm/VU8yQyHHkPpKxUZ3UBmoMy+jFYPcQaNLXgCwBD5VOYlO
	2HYdNn874EAR7KY0xJCr7VDdVdAvAgWiOwrIncdHJg==
X-Google-Smtp-Source: ACJfBouw23Md9Izu+VVmCE+TPqp2Xh0PiqQRx9B9M8aF9vDnkqNxYNAttgYMk4eNwiy+gfdWIclEoTJvWa945zGzs9E=
X-Received: by 10.107.133.88 with SMTP id h85mr21420974iod.227.1515685439997; 
	Thu, 11 Jan 2018 07:43:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Thu, 11 Jan 2018 07:43:39 -0800 (PST)
In-Reply-To: <CAJTo0LbQ3_XRqR=766aptjnT43-cyRfYVE-49OzAw3B3WDRfoA@mail.gmail.com>
References: <20180111151834.4169-1-ross.burton@intel.com>
	<ca739de3-59f6-e215-8ea5-8cbaf785cf18@linux.intel.com>
	<CAJTo0LbQ3_XRqR=766aptjnT43-cyRfYVE-49OzAw3B3WDRfoA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jan 2018 15:43:39 +0000
Message-ID: <CAJTo0LaRyWDaUmeAGeNg2qDEJU65eFg_wohuJi7DNfs8Y1iLKQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: use du --apparent-size when calculating rootfs size
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
X-List-Received-Date: Thu, 11 Jan 2018 15:43:59 -0000
Content-Type: multipart/alternative; boundary="001a113ff5843e1dd6056282044a"

--001a113ff5843e1dd6056282044a
Content-Type: text/plain; charset="UTF-8"

On 11 January 2018 at 15:42, Burton, Ross <ross.burton@intel.com> wrote:

> Exactly same patch from Maxin caused failures previously, no?
>>
>
> Hm, I knew I remembered seeing this before, and found my patches from
> 2015, but didn't see the ones from Maxin.  I'll dig the archives again
>

Found it, bad search.  Lets see what happens on the AB this time...

Ross

--001a113ff5843e1dd6056282044a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 January 2018 at 15:42, Burton, Ross <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burto=
n@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Exactly same patch from Maxin caused failures previously, =
no?<br></blockquote><div><br></div></span><div>Hm, I knew I remembered seei=
ng this before, and found my patches from 2015, but didn&#39;t see the ones=
 from Maxin.=C2=A0 I&#39;ll dig the archives again</div></div></div></div><=
/blockquote><div><br></div><div>Found it, bad search.=C2=A0 Lets see what h=
appens on the AB this time...</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a113ff5843e1dd6056282044a--
