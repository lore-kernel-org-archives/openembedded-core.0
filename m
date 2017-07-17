Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 03E54719A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 12:33:18 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id h134so42228180iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zTiFn1fGs43gQY0hVzST9ElDn4K51mjsWnBZ9orAhw8=;
	b=fV1mUvByUuYUsqN23mlLHBk00U37UrXcN7VeNeIrv05QF9iZBAJhI7GKPiYsHAOyMF
	b4535PXxcfvg0FlXvfQhP3PWUaQtnGEfC3yvIrec9GJ13yq4DEX1x19flWu+7DqpqUQw
	lvmA0HfZXbISrLSc3Jc3zEpklF/XWupF6sZisBIiKHVfGnTSz8I0jDXVdgZX6q4PHMuu
	UoDm+Ul0FIoeYAl9FvLSBaE9KhmH5yQL9pYoT2+hMyTxreCmuPEIQ6MwKQMCr3iVvNpi
	JXQywc3PU9I02Dqq/ZWjpJSfbbaty/CLeFKeSRC0qYgSYVdQv18Jc4etJPRZcIP0+q0I
	YIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zTiFn1fGs43gQY0hVzST9ElDn4K51mjsWnBZ9orAhw8=;
	b=RQvptBxmcuM+PLI2IYjCZgCxmMj5BHVYPMaLk3c5cwLYH+FGJtzsNWn5d7StE751CH
	+abjF7XRahlFVya80GgvnHzD9elNal3x3zjOVkPev3HhnbzaMTZl8lAKOgWVWY4NSG17
	T+ntgqVNPKP5jtJj+4KDYUgxXuJyvo8rLiIjrzi3VM2111BQl366hrfyiLzHqUStYe1I
	OlGNlEe2mgbDfsePpLdwzQMWUJeqYtcwFPbOPW6+LDuq/tp+m2UldQzm4sXzFrp7xLnz
	dvi+YObfCrFqT+GwaL/fxt6yFWuLyc4591iMhTNW4+pX9TTJr4nyJ6SNvTqtBmAowVuR
	Ku3Q==
X-Gm-Message-State: AIVw110WTOeuRs01b2KL2+ohgkvKwNnu++KbVf5k2G7BrZG2Cvm/vrUx
	4V9iUWluv1FOgIg43IWlROp9uwE0jER2
X-Received: by 10.107.170.212 with SMTP id g81mr18279755ioj.19.1500294799938; 
	Mon, 17 Jul 2017 05:33:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Mon, 17 Jul 2017 05:32:49 -0700 (PDT)
In-Reply-To: <242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
	<37bc3fea-105c-a22f-9386-0b0f440bd118@linux.intel.com>
	<2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
	<242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 17 Jul 2017 15:32:49 +0300
Message-ID: <CAHiDW_GhW8PaSEtbSDAANuOz=1jJ5MKXKmHQscg+KaOJa3gPVg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 17 Jul 2017 12:33:19 -0000
Content-Type: multipart/alternative; boundary="001a11425b709c4c0e0554829a0f"

--001a11425b709c4c0e0554829a0f
Content-Type: text/plain; charset="UTF-8"

I had a look at b2qt earlier and Alex asked me to share on list as well so
I'll resurrect this thread from May...

On 10 May 2017 at 14:09, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 05/10/2017 01:55 PM, Paul Eggleton wrote:
>
>> I make no secret of it - I am a Qt supporter. I'm willing to be convinced
>> that's not the right answer, though, if there are solid arguments.
>> However, if
>> you'll excuse my paraphrasing, "it's not in OE-Core and can't be,
>> therefore we
>> should just ignore it" isn't a case against it, it's a logistical issue.
>> We
>> could easily get past that by bringing meta-qt5 into poky as we do with
>> OE-
>> Core, or even just adding it to the build configuration as needed.
>>
>
> That's not what I'm saying. I'm saying that for people who want a
> 'reference UI for real products' and have no problem with Qt, we should
> officially endorse meta-b2qt.
>
> Seriosuly. They have a wayland compositor, and an app launcher, and a set
> of embedded-specific demos, and it's written and tested by specialists with
> an explicit target of making it easy to make products. And it's open source
> with optional commercial support. In that light, there is no sense
> whatsoever in solving the same problem in oe-core, poorly.


My verdict after a bit of testing and some light digging at the sources:
Very cool demo, vastly better than Sato for "Trade show demo unit" use case
(although the current content is naturally just Qt marketing). It does not
seem useful as Sato-the-QA-platform replacement and I would be wary of
suggesting it for any product use without caveats: my worry is the
maintenance status of the DE components.

Some details:
* Some of the "Desktop Environment" components are possibly not meant for
production use: e.g. the wayland compositor/WM does not seem completely
finished, either from feature or polish POV. It's even called
"democompositor". The last real code change in the relevant repo was in Feb
2016. For a single app use case this might not matter.
* It wouldn't work as a generic desktop (needs launcher specific files per
application)
* That wouldn't be so bad but the only app they include is the browser, the
rest are ads or demos (browser admittedly is very nice)

Jussi

--001a11425b709c4c0e0554829a0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>I had a look at b2qt earlier and Alex asked me to share on list as well so=
 I&#39;ll resurrect this thread from May...</div><div><br></div></div><div =
class=3D"gmail_quote">On 10 May 2017 at 14:09, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 05/10/=
2017 01:55 PM, Paul Eggleton wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
I make no secret of it - I am a Qt supporter. I&#39;m willing to be convinc=
ed<br>
that&#39;s not the right answer, though, if there are solid arguments. Howe=
ver, if<br>
you&#39;ll excuse my paraphrasing, &quot;it&#39;s not in OE-Core and can&#3=
9;t be, therefore we<br>
should just ignore it&quot; isn&#39;t a case against it, it&#39;s a logisti=
cal issue. We<br>
could easily get past that by bringing meta-qt5 into poky as we do with OE-=
<br>
Core, or even just adding it to the build configuration as needed.<br>
</blockquote>
<br></span>
That&#39;s not what I&#39;m saying. I&#39;m saying that for people who want=
 a &#39;reference UI for real products&#39; and have no problem with Qt, we=
 should officially endorse meta-b2qt.<br>
<br>
Seriosuly. They have a wayland compositor, and an app launcher, and a set o=
f embedded-specific demos, and it&#39;s written and tested by specialists w=
ith an explicit target of making it easy to make products. And it&#39;s ope=
n source with optional commercial support. In that light, there is no sense=
 whatsoever in solving the same problem in oe-core, poorly.=C2=A0</blockquo=
te><div><br></div><div><div><div>My verdict after a bit of testing and some=
 light digging at the sources: Very cool demo, vastly better than Sato for =
&quot;Trade show demo unit&quot; use case (although the current content is =
naturally just Qt marketing). It does not seem useful as Sato-the-QA-platfo=
rm replacement and I would be wary of suggesting it for any product use wit=
hout caveats: my worry is the maintenance status of the DE components.</div=
><div><br></div></div><div>Some details:</div><div>* Some of the &quot;Desk=
top Environment&quot; components are possibly not meant for production use:=
 e.g. the wayland compositor/WM does not seem completely finished, either f=
rom feature or polish POV. It&#39;s even called &quot;democompositor&quot;.=
 The last real code change in the relevant repo was in Feb 2016. For a sing=
le app use case this might not matter.=C2=A0<br></div><div>* It wouldn&#39;=
t work as a generic desktop (needs launcher specific files per application)=
</div><div>* That wouldn&#39;t be so bad but the only app they include is t=
he browser, the rest are ads or demos (browser admittedly is very nice)</di=
v><div><br></div><div>Jussi</div><div><br></div></div></div></div></div>

--001a11425b709c4c0e0554829a0f--
