Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 570ED7E584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:43:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x19so97793826eda.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GLOaYKyLF+ljrjqiJOc21Uo/NpO7G+vrHq5Sb0Zja5s=;
	b=D5cM0c8FsAY93h8EIpMes/+umb7L/hn2EEfbFJeeQbtnj0TjxfIV8+OqDQHXZaPiWB
	5V54chj8E+tYpXR3xuGyIC4X5x00NnuDnM0JzDMvGGSl8OheDRzPGd85ODInsl4g8MfP
	k6y5wWlFxH7pQNLKR5Ldr8Uq/RKeq/esOkD1dDbOcTCyzECf24DKVrP6EMlSOliTzHH8
	axeuB94SuTv6wnvKU3z+DxsSc+wizUhJa9t8zPKSl+O61e58LmNGWg9tQ7JyneCdFJyf
	O8NQoMw9nMYrpzOc+TJz49a21wOluMHnAqHi2eZAwgF/obsk4WrvGRW5S6Wpfz73vryG
	f2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GLOaYKyLF+ljrjqiJOc21Uo/NpO7G+vrHq5Sb0Zja5s=;
	b=hFr0VbsO6ksj88yt9ZpKrcIWrL80jOPk2zSDOdfNY9hCN9sT+pefgbnblZuujTKe7r
	FurcWzGl8B4Y5OFXEhcwB7ZrRRIgRh53xUSy3PjxTcn+Y2eY/eWuNT2Flp56HHwtRpk7
	jaY/tCOqEStgCoxnNDwSyndDQfBAShIwEfvj5Oko2vEDqQzXsRmZ8mqOcimO/DctZH2c
	Pg7NFFJnw4bsyv5sLnUxFn+m4CQ3yfuAgdWsidq3ri0nAYnrNBwkFT4HvWD4iBV1CaE8
	nLWCguL8FYVC2o6QQrqRADYQobAHvuS1qC+QvlACNjYv3j9PxBQqI+2MtGKs8zn1xQQ7
	6jBQ==
X-Gm-Message-State: APjAAAVEjQW9RsOJRJlYSSGxo+ol95lS5QxMeKWPlfJlNwblfWkr/R/F
	d3VQRAbV9IbL2CL3/um7L7SRGzcNmPzu8GuY1cg=
X-Google-Smtp-Source: APXvYqxvpLGTmeFGxuF0UGz11vdN6LAZcqKzYNNJ1uCqxSexlJ28LM2YmNUWoNZitJtHQppA9hmiDORbTkw7ypijdi4=
X-Received: by 2002:a50:ba68:: with SMTP id 37mr24371567eds.216.1565617408100; 
	Mon, 12 Aug 2019 06:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UMS8VN9BkeX5iVD5vEgnc4XrSbesE1zp8Z4ouXudSU3ew@mail.gmail.com>
	<4c4a42ae-ca41-47cc-d555-7648f8067c69@oleksandr-kravchuk.com>
In-Reply-To: <4c4a42ae-ca41-47cc-d555-7648f8067c69@oleksandr-kravchuk.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Aug 2019 15:43:16 +0200
Message-ID: <CA+chaQdMJJcu9uvHeybu5rHgwWD4NmWhxo9QoucOn6ki6NXNcQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [BUG] patch linux-firmware: bump to 20190618 breaks package index
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
X-List-Received-Date: Mon, 12 Aug 2019 13:43:28 -0000
Content-Type: multipart/alternative; boundary="00000000000076ce4d058febb5ad"

--00000000000076ce4d058febb5ad
Content-Type: text/plain; charset="UTF-8"

PE was dropped, so version definitely went backwards and QA is right to
complain.

On Mon, Aug 12, 2019 at 3:41 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Hi Nicola,
>
> How do I reproduce this? It builds fine for me.
>
> On 12/08/2019 15:38, nick83ola wrote:
> > Hi all
> > after this patch I got a ton of errors regarding Package version went
> backwards
> >
> > Cheers
> > Nicola Lunghi
> >
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-src went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-dbg went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-ralink-license went backwards which
> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> > 0:20190618-r0) [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-ralink went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-mt7601u-license went backwards
> > which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> > 0:20190618-r0) [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-mt7601u went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-radeon-license went backwards which
> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> > 0:20190618-r0) [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-radeon went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-marvell-license went backwards
> > which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> > 0:20190618-r0) [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-pcie8897 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-pcie8997 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8686 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8688 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8787 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8797 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8801 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8887 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-sd8897 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-usb8997 went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-ti-connectivity-license went
> > backwards which would break package feeds from
> > (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0) [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-wlcommon went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-wl12xx went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-wl18xx went backwards which would
> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
> > [version-going-backwards]
> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
> > version for package linux-firmware-vt6656-license went backwards which
> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
> > 0:20190618-r0) [version-going-backwards]
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000076ce4d058febb5ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PE was dropped, so version definitely went backwards and Q=
A is right to complain.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Aug 12, 2019 at 3:41 PM Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksa=
ndr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Nicola,<br>
<br>
How do I reproduce this? It builds fine for me.<br>
<br>
On 12/08/2019 15:38, nick83ola wrote:<br>
&gt; Hi all<br>
&gt; after this patch I got a ton of errors regarding Package version went =
backwards<br>
&gt;<br>
&gt; Cheers<br>
&gt; Nicola Lunghi<br>
&gt;<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-src went backwards which would<br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-dbg went backwards which would<br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-ralink-license went backwards which=
<br>
&gt; would break package feeds from (1:0.0+git0+711d3297ba-r0 to<br>
&gt; 0:20190618-r0) [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-ralink went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-mt7601u-license went backwards<br>
&gt; which would break package feeds from (1:0.0+git0+711d3297ba-r0 to<br>
&gt; 0:20190618-r0) [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-mt7601u went backwards which would<=
br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-radeon-license went backwards which=
<br>
&gt; would break package feeds from (1:0.0+git0+711d3297ba-r0 to<br>
&gt; 0:20190618-r0) [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-radeon went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-marvell-license went backwards<br>
&gt; which would break package feeds from (1:0.0+git0+711d3297ba-r0 to<br>
&gt; 0:20190618-r0) [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-pcie8897 went backwards which would=
<br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-pcie8997 went backwards which would=
<br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8686 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8688 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8787 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8797 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8801 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8887 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-sd8897 went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-usb8997 went backwards which would<=
br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-ti-connectivity-license went<br>
&gt; backwards which would break package feeds from<br>
&gt; (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0) [version-going-backwards]<=
br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-wlcommon went backwards which would=
<br>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-wl12xx went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-wl18xx went backwards which would<b=
r>
&gt; break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)<b=
r>
&gt; [version-going-backwards]<br>
&gt; ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package<br=
>
&gt; version for package linux-firmware-vt6656-license went backwards which=
<br>
&gt; would break package feeds from (1:0.0+git0+711d3297ba-r0 to<br>
&gt; 0:20190618-r0) [version-going-backwards]<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000076ce4d058febb5ad--
