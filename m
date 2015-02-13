Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3BEE3733CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 17:42:26 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id p6so14990756qcv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 09:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eTXDAyuVZjfEuDrC1nMiVkjLXrhObtShwVGfB09z4vE=;
	b=hlMHva7h7SYW/S67KuB/NqJuG6RhGBF1NUS20yqe7w/dugYWhUqRVN3ofCn8vh1JtR
	IcIreSGX0rpd35q7+oybEX0goQSBAWhIAPLdNsMTO5pj5XMMRg5GGXzZVkwbgGjHgdL9
	pg/zHKVgp8V5lc48qCqZRMl7XQ7L9seC8DC2EFw1thF8GTfoUMldtEOTl+FlbaamZOPG
	jWMsTb1MKEe4fEDOenhvVctBi8tFr/VoR799prEgPyNxmfO/b/gC8LgIaHI9rFVsOrVm
	soAGHpXBR78v3tYOqJ1GJOxVn+B0GV54w60FbyPIdknh3jvVCmXiUtqkVw6O9BbolS4m
	NWBA==
X-Gm-Message-State: ALoCoQnq8t+F2fQRx8IqQHIu7K4gecxazX+NSuqWNm/iP1lEnvY9JkIfUhsjSI0UTBq7CK3YcN7Z
X-Received: by 10.140.92.161 with SMTP id b30mr25304477qge.59.1423849347633;
	Fri, 13 Feb 2015 09:42:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 09:42:07 -0800 (PST)
In-Reply-To: <CALbNGRRyqtB8OxZqg+ovmAMgGWzrrt0tfHW4mqBR04_JX6XAeQ@mail.gmail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
	<1423807195-7087-6-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYvo-TGVuVo1vu-b0FS+_i1UpnkZGYj1HXRyefFNZJkDg@mail.gmail.com>
	<CALbNGRRyqtB8OxZqg+ovmAMgGWzrrt0tfHW4mqBR04_JX6XAeQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 17:42:07 +0000
Message-ID: <CAJTo0LZjCYv5MsvGZh-y57_C0WGOMGtAeG7YK5FqN3YZNMbEVA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] liberation-fonts: update to 1.07.4
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
X-List-Received-Date: Fri, 13 Feb 2015 17:42:32 -0000
Content-Type: multipart/alternative; boundary=001a1139baf09488dd050efbc2cc

--001a1139baf09488dd050efbc2cc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 February 2015 at 17:36, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> to me fontforge-native was just a use-case. I need it for kde's oxygen
> fonts and would like to have it on target too. So I'll try meta-oe -
> if unsuccessful there put it back my layer. So forget 4-6 of this
> series.
>
What about 1-3?
>

1 and 2 I've merged into mut-next, 3 was triggering my spider sense as
binconfig is generally broken and we prefer to just disable it globally and
replace users with pkg-config, but I didn't yet get to have a proper look.

Ross

--001a1139baf09488dd050efbc2cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2015 at 17:36, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":mdo" class=3D"a3s" style=3D"overflow:hidden">to me fontforge-nati=
ve was just a use-case. I need it for kde&#39;s oxygen<br>
fonts and would like to have it on target too. So I&#39;ll try meta-oe -<br=
>
if unsuccessful there put it back my layer. So forget 4-6 of this<br>
series.=C2=A0</div></blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
mdo" class=3D"a3s" style=3D"overflow:hidden">
What about 1-3?</div></blockquote></div><br>1 and 2 I&#39;ve merged into mu=
t-next, 3 was triggering my spider sense as binconfig is generally broken a=
nd we prefer to just disable it globally and replace users with pkg-config,=
 but I didn&#39;t yet get to have a proper look.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139baf09488dd050efbc2cc--
