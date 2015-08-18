Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5972D65C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 11:48:48 +0000 (UTC)
Received: by qgj62 with SMTP id 62so114613518qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 04:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EGfrtPXQ0OXPjbFEtCYP6HVlxoQxcV4Ger/LIp3OoDk=;
	b=BqIW2vRj8q8x85YQfBF0Z2nvgyTw9hOUS1OSwAT3M7isI/n2AINM6r4Fo7Ffykc5lG
	QXlvKPXn/GNf8GmiIn8ot/eeqTYfq3WqEY8R0m6wYYMJsaTisxEsiyrwuGmz+raee9l5
	5KweLP+I/ir4nASgVKfVRtbQGwwi9tT6ohrQLbuZ0Kb+6T2ztDl3tJlpjIegKQdNL+HI
	rJdnXTkbrF/vLNmEjCJ65l18Lbn2OlvSh8xbUgieN+b1ndkAcGlm9NEIE08hRg2WY8bq
	Na+Xls0qN4ErmcZY5nBUfEfmIg9+aC1Xu3aV+fkTMW3FwvpyC1wBfBsousKMx6D5Yzxm
	7PkQ==
X-Gm-Message-State: ALoCoQka9ZUHY1Z9eGbd48Ayim0yse+O3jMKbF9zDGVuG6uDRYbvhIjS+3qfj+c4ob2zPByyYjOk
X-Received: by 10.140.133.67 with SMTP id 64mr12513104qhf.52.1439898528794;
	Tue, 18 Aug 2015 04:48:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 18 Aug 2015 04:48:29 -0700 (PDT)
In-Reply-To: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>
References: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Aug 2015 12:48:29 +0100
Message-ID: <CAJTo0LaE6h3_uXobYVy0BtydyNWQQ_m2d5j6H-vGnnN0+meyNg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: package nscd related files
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
X-List-Received-Date: Tue, 18 Aug 2015 11:48:51 -0000
Content-Type: multipart/alternative; boundary=001a1136fdce525fc5051d9480d1

--001a1136fdce525fc5051d9480d1
Content-Type: text/plain; charset=UTF-8

On 13 August 2015 at 09:09, <rongqing.li@windriver.com> wrote:

> install nscd related configuration file, startup files, and package them,
> make nscd easy to startup
>

systemd.bbclass is inherited but SYSTEMD_PACKAGES isn't set, so the systemd
postinst/prerm fragments won't get added.

Ross

--001a1136fdce525fc5051d9480d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 August 2015 at 09:09,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1at" class=3D"a3s=
" style=3D"overflow:hidden">install nscd related configuration file, startu=
p files, and package them,<br>
make nscd easy to startup<br></div></blockquote></div><br>systemd.bbclass i=
s inherited but SYSTEMD_PACKAGES isn&#39;t set, so the systemd postinst/pre=
rm fragments won&#39;t get added.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1136fdce525fc5051d9480d1--
