Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id CCA1B7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 14:17:44 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id q16so11055461vsm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AHiAnJkGBtwDXVFiMWhbfcDDIdzasiaonByGmGoKNEM=;
	b=IXWUXi7aOL3msa+bjZvOuH7J8U6QSXZPtlgnYWbLUNzprQhzUYV+bfZU/ek2l2AwNO
	zuXpUcbOlReA/SzhwxvNeeZZ0/ZHB2QFNjMexe6By+0OlkXWLi6nKJOz0ElWHiaR+w4A
	rQMDpnvA21W7HODNQxV7o3dIUPG3pLL1fE+0wB8YwL7hxw/id5Y6zgMu7YHF37IUFDcM
	2VTkrYy6PGRcaL4wY+y8drNzuvyROGF/xDgdHiomOScuoaM7HL/DO9t5sGhU+ceViTTR
	SKETHSw4uaTxB3QmDtAhLE+bXKN17LHkL88Emj7UHu+AVNQJJjcq30vv6+ic9DMn7i71
	jmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AHiAnJkGBtwDXVFiMWhbfcDDIdzasiaonByGmGoKNEM=;
	b=LH1o9HzZCaWyJ4vbSAfpVkIZYoQPCmqSiLOKJ4q/C/qdrQsQT7YgM/9fhBoQP6Tx1B
	EfT0Evn4s1nPiG1yDJc4geRCn3LUCibyrUV6VaSrnxncQu3xgARqdramq93ilbJ54hxO
	h0mmI2nw7G6UjBYrstLgMJHSsNEW56BvGsQmk4lb8YWwpw2hbEkq/fTQA7jQSYyR0K6k
	y7EFEcPhrtbZPauxKQp5/QQRaFklyGA6T826sh/qlMtN/W0KX8nnIoPWT4kadQf7YE0z
	xVXkm1VijFMsi/oSLS4P2zf89/Ktezz7etqlW9aa/vdYcNC+q5iaaFxOs2Y9XG3few/g
	WtKA==
X-Gm-Message-State: APjAAAXzr/+QcYNWSFnUApnIC3lQuVydqYaaN8t00myiFDKJn4LPmsHX
	QIqpnRfOfTX14zOoUCES9+9u17GJnIosMuure83L5haN
X-Google-Smtp-Source: APXvYqw+7deYWcz2LQ7mGsZ2XMxb7DLowb3dwvNy+0eyPyYqTYr5obpQD1T/eYFXXEA88qnNaTRoVFbx4wFoJheGqZc=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr10414560vsb.25.1566829065529;
	Mon, 26 Aug 2019 07:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
	<86a7eb4c-1097-1534-58b1-0ee61f16133f@gin.de>
In-Reply-To: <86a7eb4c-1097-1534-58b1-0ee61f16133f@gin.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2019 16:17:33 +0200
Message-ID: <CANNYZj-cMhE4S2LGHpWKiZiFWOTeaOuPYKmW1Bdc1FtSu9XGYg@mail.gmail.com>
To: Daniel Klauer <daniel.klauer@gin.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.69 -> 1.71 upgrade for 3.0?
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
X-List-Received-Date: Mon, 26 Aug 2019 14:17:45 -0000
Content-Type: multipart/alternative; boundary="000000000000dfeef5059105d152"

--000000000000dfeef5059105d152
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Aug 2019 at 11:21, Daniel Klauer <daniel.klauer@gin.de> wrote:

> On 22.08.19 21:19, Randy MacLeod wrote:
> > I'm checking if you have done any work on upgrading the
> > boost recipe?
> Not long ago I've looked at updating the boost recipe to 1.71.0-beta1
> (when 1.71.0 wasn't released yet) because of some bugs encountered with
> 1.69.0 (and 1.70.0 being buggy too). See the attached patch (it is based
> on poky warrior).
>
> It was not trivial due to changes to bjam bootstrap scripts, but I got
> it working. I'd be interested in updating it to the final 1.71.0 too,
> including backporting to warrior.
>

Thanks, I have integrated most of your patch into mine, and will send it to
the list in a moment.

Alex

--000000000000dfeef5059105d152
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 26 Aug 2019 at 11:21, Daniel Klau=
er &lt;<a href=3D"mailto:daniel.klauer@gin.de">daniel.klauer@gin.de</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 22.08.19 21:19, Randy MacLeod wrote:<br>
&gt; I&#39;m checking if you have done any work on upgrading the<br>
&gt; boost recipe?<br>
Not long ago I&#39;ve looked at updating the boost recipe to 1.71.0-beta1<b=
r>
(when 1.71.0 wasn&#39;t released yet) because of some bugs encountered with=
<br>
1.69.0 (and 1.70.0 being buggy too). See the attached patch (it is based<br=
>
on poky warrior).<br>
<br>
It was not trivial due to changes to bjam bootstrap scripts, but I got<br>
it working. I&#39;d be interested in updating it to the final 1.71.0 too,<b=
r>
including backporting to warrior.<br></blockquote><div><br></div><div>Thank=
s, I have integrated most of your patch into mine, and will send it to the =
list in a moment. <br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000dfeef5059105d152--
