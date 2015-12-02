Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAEC605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 16:47:46 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so36632882igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RlB9OIMOJkY87G9iDo6xEPjA1xUPpg/6KKDCyQL7LEU=;
	b=K1dO+0OEJliLW8WUA8VxIsJ9BS46oAduh/1lrKl/JxPYVBSsMblNZ7YteOUGL45lFi
	QGXP6h0vLAPtAgX3/rkQxUaGNdbSm9r+XbdFZXOh4ovUdXN/5qpuIkqaokg5x92DTdi8
	w6PXntLPCEHLNtrEFeGYEJwM5b7a83IUG3aMcmY8KHAzBEycZVG2A9xMm9UbNXa3dfoC
	CyN+lKSYG3PJMPy2icRMqtN1GIyeRUCs1vO3/jsZa7nDVpvJ+6kK20Bk+DXi4AyN/oPy
	IPJclCKeyfTMCbLH53PnXg1G8m49BTdewZeUoQt08OxjdwKAV5sLJcOM4ntFq91evbx5
	4IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RlB9OIMOJkY87G9iDo6xEPjA1xUPpg/6KKDCyQL7LEU=;
	b=CN/dSgS6NxATwV7odELnAYIAbaE+K2w0Wo23s4vjhay40ZfkSvhmoFI/+znsxh5KBt
	kQd4SV2ZdY2cDGJ6cMZH4Cm74QnfNJyKQj3rdv1OtxOUHBOgWuG/6hhZd/wpps+2MPsK
	sb45CbAxVS4NFK/811DrmjOLAqhLAVWiBizhClS4u48smjwYvlg2QyjTz+eC33OwRyVs
	rSlwZdAj4XN2xNZ+shkp3Rd9bx+U7lpwPe+3CTLtQCeZrcBDpZ6ptgj5ZYdSYVbvDgc5
	dbCFWNegW+S4j3js2BW3eCk+jvhH/uI/usp0dqfkQuX7aUSjwg1EG/FvmF/SfknKeHVv
	P9Rg==
X-Gm-Message-State: ALoCoQmxHjP1MR6HkizNbzz57mslT7mzmGL58W5XkhRdShVto4KShFp0d2YOQ9wjJix7IEcYM02g
X-Received: by 10.50.138.2 with SMTP id qm2mr2334778igb.64.1449074867550; Wed,
	02 Dec 2015 08:47:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 08:47:28 -0800 (PST)
In-Reply-To: <1449073639.10734.65.camel@intel.com>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<1449073639.10734.65.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 16:47:28 +0000
Message-ID: <CAJTo0LZZZ8O_xnpg2fmqbD77JVWq89aYSUUujAWm7JbN=Q51hw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Wed, 02 Dec 2015 16:47:47 -0000
Content-Type: multipart/alternative; boundary=001a1135ffb0bbd7ad0525ed08fc

--001a1135ffb0bbd7ad0525ed08fc
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 16:27, Patrick Ohly <patrick.ohly@intel.com> wrote:

> I'm not sure about the "more complicated to do changes in external
> layers". Why is that?
>
> Quite the opposite, I found it useful that the version independent build
> rules (*) were in a .inc file and relied on including that .inc file in
> a "dbus-cynara" recipe which builds a specific fork of the source code
> [2].
>
> But I understand that this is an unusual usage of OE-core. As I didn't
> notice the change in time (it's in master now), I'll just copy the
> previous content of dbus.inc.
>

When a bb and an inc are split the inc has to be considered some sort of
ABI.  For example, you couldn't remove a configure option that was removed
in a new release from the .inc because older recipes that use the inc will
still want it.  Then of course on new recipes that triggers a QA warning.
New options need to be added to the relevant .bb and not the inc, but then
break if other users don't notice that they need to add options
explicitly.  Basically the idea of bb/inc seems good, and in some
situations is useful (multiple recipes maintained *in the same place*
sharing common code) but as a method of re-using packaging it's got many
pitfalls, especially as your recipe could include the .bb from oe-core
directly or be a bbappend.

Ross

--001a1135ffb0bbd7ad0525ed08fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 16:27, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"=
mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1l3" class=
=3D"a3s" style=3D"overflow:hidden">I&#39;m not sure about the &quot;more co=
mplicated to do changes in external<br>
layers&quot;. Why is that?<br>
<br>
Quite the opposite, I found it useful that the version independent build<br=
>
rules (*) were in a .inc file and relied on including that .inc file in<br>
a &quot;dbus-cynara&quot; recipe which builds a specific fork of the source=
 code<br>
[2].<br>
<br>
But I understand that this is an unusual usage of OE-core. As I didn&#39;t<=
br>
notice the change in time (it&#39;s in master now), I&#39;ll just copy the<=
br>
previous content of dbus.inc.</div></blockquote></div><br>When a bb and an =
inc are split the inc has to be considered some sort of ABI.=C2=A0 For exam=
ple, you couldn&#39;t remove a configure option that was removed in a new r=
elease from the .inc because older recipes that use the inc will still want=
 it.=C2=A0 Then of course on new recipes that triggers a QA warning.=C2=A0 =
New options need to be added to the relevant .bb and not the inc, but then =
break if other users don&#39;t notice that they need to add options explici=
tly.=C2=A0 Basically the idea of bb/inc seems good, and in some situations =
is useful (multiple recipes maintained *in the same place* sharing common c=
ode) but as a method of re-using packaging it&#39;s got many pitfalls, espe=
cially as your recipe could include the .bb from oe-core directly or be a b=
bappend.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a1135ffb0bbd7ad0525ed08fc--
