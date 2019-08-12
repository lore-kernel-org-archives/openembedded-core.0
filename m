Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id 945E36C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:46:27 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id f9so278370uaj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VaMvH+OCRmjQrzHKZPEHU91GQqG+2w9u0KUr/8zqpvk=;
	b=LTscFPq+Nz6pqw2luoqQXtElWXAreFnSdOfIpsmO0lqlSbm0jVdRBmayAm/3Ieo4j/
	+v9jmwpjig9f/POgrbXjCE9RGYdOtpoGgaiMN1klcWLGjv0D2KJcKXXoDNc0AhEgQkyD
	S/83HlymxFvgJ6+d8s/sBAV1uUYzkcgyYvwbMwbK31fJmIMCs/LE8+ln7IPzlnOJ+p4M
	U3gAgWK8OBXY8Sx4hS3BG4EYIeK8LDbhnyOAi1rry3fyWAtgqvnAjpj6GH7mg+mNuWUH
	mdbyFLb4LMeMypm2duPGEi1XjaxS6C6v1/rO09JId1B+SsWaZCta7ymVltfzex8XFya+
	r3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VaMvH+OCRmjQrzHKZPEHU91GQqG+2w9u0KUr/8zqpvk=;
	b=cgxo4zK7rD/Mii33O89V/gIGcNV4uDWyQrrSmLw8tbjkr/wEdaA4shPU23BGu3RyGG
	M967pTwXUacANn8UKLPbk+zyWwDMZLy207eXZxjjRlVieRULZ5IauL+mqwIMsfnNHkr5
	nEC2Rr6lWHa5LmEBU/nZ1sH/5TssAViBJiEfI6srX+2ykhSStrAdIA3SlF2Rt6NESJ13
	20ZdseJ/UqL4zifymccyzSpx4/L6dDAQJEnUtZ1PACIGuQ0ln8pwlqVieMqDW+56Hxe3
	2yyL0DKu7Ai1XcpZOyhE5JBk3LQr61M/4UQrCEK8kGpqtKyxl6Up/WfnznK8+wyEqxWV
	Qepw==
X-Gm-Message-State: APjAAAVRqAnESY2DmqYc0KbKKzIjByGiO8OMPWGJtM9/eHFJH2rxUPCp
	wFTnecGSXLeNUfly6klajh4J3YDUsMr7HkT3wVI=
X-Google-Smtp-Source: APXvYqyskOhJEhdBax36KkvcJ+quLPtuPJYr3li2Ig52W0hqib5x8Fxz3jQB8Krp0CGrcZKLTBoIq0Z4QdXd6wdzoY8=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr960420uak.71.1565617588440;
	Mon, 12 Aug 2019 06:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UMS8VN9BkeX5iVD5vEgnc4XrSbesE1zp8Z4ouXudSU3ew@mail.gmail.com>
	<4c4a42ae-ca41-47cc-d555-7648f8067c69@oleksandr-kravchuk.com>
	<CA+chaQdMJJcu9uvHeybu5rHgwWD4NmWhxo9QoucOn6ki6NXNcQ@mail.gmail.com>
In-Reply-To: <CA+chaQdMJJcu9uvHeybu5rHgwWD4NmWhxo9QoucOn6ki6NXNcQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2019 15:46:17 +0200
Message-ID: <CANNYZj-eW3mWzRo4pBMo+mXmq0dBv4Ev4zT3VsoT5VzOqXWJOA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
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
X-List-Received-Date: Mon, 12 Aug 2019 13:46:27 -0000
Content-Type: multipart/alternative; boundary="0000000000003693e8058febc0b3"

--0000000000003693e8058febc0b3
Content-Type: text/plain; charset="UTF-8"

Yes, PE needs to be restored. (it is package epoch, which is used when
versioning scheme needs to change for whatever reason, with the new version
going backwards. Here the version goes from 0.0 to 20190618 (an improvement
I would say), so we can keep the original PE).

To reproduce, 'bitbake -c cleansstate linux-firmware', then build the
original version, then the new one.

Alex

On Mon, 12 Aug 2019 at 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> PE was dropped, so version definitely went backwards and QA is right to
> complain.
>
> On Mon, Aug 12, 2019 at 3:41 PM Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
>
>> Hi Nicola,
>>
>> How do I reproduce this? It builds fine for me.
>>
>> On 12/08/2019 15:38, nick83ola wrote:
>> > Hi all
>> > after this patch I got a ton of errors regarding Package version went
>> backwards
>> >
>> > Cheers
>> > Nicola Lunghi
>> >
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-src went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-dbg went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-ralink-license went backwards which
>> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
>> > 0:20190618-r0) [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-ralink went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-mt7601u-license went backwards
>> > which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
>> > 0:20190618-r0) [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-mt7601u went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-radeon-license went backwards which
>> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
>> > 0:20190618-r0) [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-radeon went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-marvell-license went backwards
>> > which would break package feeds from (1:0.0+git0+711d3297ba-r0 to
>> > 0:20190618-r0) [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-pcie8897 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-pcie8997 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8686 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8688 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8787 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8797 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8801 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8887 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-sd8897 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-usb8997 went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-ti-connectivity-license went
>> > backwards which would break package feeds from
>> > (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0) [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-wlcommon went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-wl12xx went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-wl18xx went backwards which would
>> > break package feeds from (1:0.0+git0+711d3297ba-r0 to 0:20190618-r0)
>> > [version-going-backwards]
>> > ERROR: linux-firmware-20190618-r0 do_packagedata: QA Issue: Package
>> > version for package linux-firmware-vt6656-license went backwards which
>> > would break package feeds from (1:0.0+git0+711d3297ba-r0 to
>> > 0:20190618-r0) [version-going-backwards]
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003693e8058febc0b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, PE needs to be restored. (it is package epoch, w=
hich is used when versioning scheme needs to change for whatever reason, wi=
th the new version going backwards. Here the version goes from 0.0 to 20190=
618 (an improvement I would say), so we can keep the original PE).<br></div=
><div><br></div><div>To reproduce, &#39;bitbake -c cleansstate linux-firmwa=
re&#39;, then build the original version, then the new one.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, 12 Aug 2019 at 15:43, Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
">PE was dropped, so version definitely went backwards and QA is right to c=
omplain.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Aug 12, 2019 at 3:41 PM Oleksandr Kravchuk &lt;<a href=3D"m=
ailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.source@ole=
ksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Nicola,<br>
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
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003693e8058febc0b3--
