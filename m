Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE727199C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 21:40:45 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id q130so2246685qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 13:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oa89ONUWeik6272aOBcfk09NLbQ88IMEJRZ3xU2zC0Y=;
	b=t4ScjSHu8sPnyNSImsIJFyUAvsUdT9/WvxY4ekLdWp8DpPGZkZFEQi2eFyej9bZSYs
	vvOZpKxXjBdMTBhLupvDeSV9AsAsUgUy7emg1u9NDrO3+H0eQzS3AFZrxTiYRMXgH1Tu
	J63dTdULEetCbFn3+TZLecKVpo2r86gTmbHTT8C2z8+d7YimQab3/pzi/Xayf+vIXlo5
	/AHuiKoBo4J37Jb1J4d7PpvI0CY32KhirGPVLgl9RBxtlS71jDJ2RJWP9y4QuMg72ep1
	PIBMJo0mi8ovgp1iAm46IOkDgDa+c2TLETCfRT5N0a+3q5rYyzBqsKj9mAHLXuEgblXS
	yvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oa89ONUWeik6272aOBcfk09NLbQ88IMEJRZ3xU2zC0Y=;
	b=e6f9NRFCyBtyKgZLneMY2L8KaMzuBDzzflc/SURrGA0esbWLmoFGG8cQGk05ekYjNw
	2uK4fTf/K8SoDpZWLO42pQeg6HlRrjqGEWbAsAARMozXFuDG4wiQeUIDGdYl5WTV3BoK
	zO/8ZIp9NdWtHHm97vUbzEiDoI9XnYRUrfcQiWKJeIIzdyHdtTF17RTGjg7ATD1WB3s2
	Mp5thj+yijZpqLSGRiXiq1By9HTc7InUSfyFwaFp9zpSBJo+FWgrK0sr3rZmpmlsrj2R
	o6PZLTsUSPWnrBj08vt8OdCzCuhPSzAy86fjv9QNCgqtgOUb5fTkc1xKx1l17Efy9aNQ
	k1Ug==
X-Gm-Message-State: AKaTC000QhBR6GK9QcEERXDPavLv5Fn4ti7XkdMkKrVS1g3bybx5fSdKm9PkxJoJW/uRuRZVYPdc1xj9k+CrKjBh
X-Received: by 10.55.207.78 with SMTP id e75mr30446241qkj.36.1480455647245;
	Tue, 29 Nov 2016 13:40:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 29 Nov 2016 13:40:26 -0800 (PST)
In-Reply-To: <20161129211720.12594-1-edwin.plauchu.camacho@linux.intel.com>
References: <20161129211720.12594-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Nov 2016 21:40:26 +0000
Message-ID: <CAJTo0LbPfRyv0HLBUsXaLGmXjZzUqhe-M_=Z+GrCR4=oWYK9mA@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] texinfo upgrade to 6.3
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
X-List-Received-Date: Tue, 29 Nov 2016 21:40:46 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8f62b220542777064

--001a1145b7b8f62b220542777064
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 21:17, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> -           file://disable-native-tools.patch \
>

Should this patch be deleted?

Ross

--001a1145b7b8f62b220542777064
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 November 2016 at 21:17, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":bo" class=3D"a3s aXjCH m158b1f275c13d9a5">-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-native-tools.<wbr>patch \=
<br></div></blockquote></div><br>Should this patch be deleted?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b8f62b220542777064--
