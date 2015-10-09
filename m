Return-Path: <petter@technux.se>
Received: from bin-vsp-out-04.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2D1605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 06:53:05 +0000 (UTC)
X-Halon-ID: 607bd552-6e52-11e5-bfe4-005056917c0c
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPA;
	Fri,  9 Oct 2015 08:52:58 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 09 Oct 2015 08:53:02 +0200
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: Marko Lindqvist <cazfi74@gmail.com>
Organization: Technux
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <CAF6bG8eud0qLNLaqNtBVVgyff8iiSp=g1DsFUh6Sk-ECQthvvA@mail.gmail.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
	<CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
	<7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
	<CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
	<CAF6bG8eud0qLNLaqNtBVVgyff8iiSp=g1DsFUh6Sk-ECQthvvA@mail.gmail.com>
Message-ID: <0299971cf181f7c7cfbf7e7749295540@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: petter@technux.se
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 06:53:08 -0000
Content-Type: multipart/alternative;
	boundary="=_282d5000b05e3f9b2be16d0019803cfc"

--=_282d5000b05e3f9b2be16d0019803cfc
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

2015-10-08 06:31 skrev Marko Lindqvist: 

> On 6 October 2015 at
17:08, Burton, Ross <ross.burton@intel.com> wrote:
> 
>> On 6 October
2015 at 14:43, Petter Mabäcker <petter@technux.se> wrote: 
>> 
>>>
Great. As you will notice also when formatted properly it will not apply
due to that readline63-001 and readline63-002 isn't applied so
'patchlevel' is incorrect. That makes me wondering what the patching
strategy is? In my opinion we should consider adding the official
readline-6.3 patches as well. Should I add a bug report for that or
leave it as is (depending on the strategy...)?
>> Adding the rest of the
patches would have been a sensible thing to do. Right now, we're frozen
as we're about to release 2.0, but a bug or patches post-release would
be much appreciated. Ross
> 
> The strategy I introduced in
30a38ea1ee933fb134a5ee9000298703cab93692
> was not to add the patches,
but to fetch them as upstream source.
> That was dropped when readline
was updated to 6.3 (maybe there was no
> patches for it at the time):
>
66bc6f4127e88db18e260c71d181aecfd58c7999
> 
> - ML

Hello Marko, 

When
looking at the dates for the 6.3 integration my guess is that no patches
existed for 6.3 yet (compared to the dates for the patches..). I will
give it a try to use your 5.2 strategy when applying the 6.3 patches to
make it looks the same for both versions. Thanks for pointing this out!


BR Petter 

Petter Mabäcker

Technux
<petter@technux.se>
www.technux.se

 

--=_282d5000b05e3f9b2be16d0019803cfc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>&nbsp;</p>
<p>2015-10-08 06:31 skrev Marko Lindqvist:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>On 6 October 2015 at 17:08, Burton, Ross &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a>&gt; wrote:</pre>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%">On 6 October 2015 at 14:43, Petter Ma=
b&auml;cker &lt;<a href=3D"mailto:petter@technux.se">petter@technux.se</a>&=
gt; wrote:
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%">Great. As you will notice also when f=
ormatted properly it will not apply due to that readline63-001 and readline=
63-002 isn't applied so 'patchlevel' is incorrect. That makes me wondering =
what the patching strategy is? In my opinion we should consider adding the =
official readline-6.3 patches as well. Should I add a bug report for that o=
r leave it as is (depending on the strategy...)?</blockquote>
Adding the rest of the patches would have been a sensible thing to do. Righ=
t now, we're frozen as we're about to release 2.0, but a bug or patches pos=
t-release would be much appreciated. Ross</blockquote>
<pre>The strategy I introduced in 30a38ea1ee933fb134a5ee9000298703cab93692
was not to add the patches, but to fetch them as upstream source.
 That was dropped when readline was updated to 6.3 (maybe there was no
patches for it at the time):
66bc6f4127e88db18e260c71d181aecfd58c7999


 - ML </pre>
</blockquote>
<p>Hello Marko,</p>
<p>When looking at the dates for the 6.3 integration my guess is that no pa=
tches existed for 6.3 yet (compared to the dates for the patches..). I will=
 give it a try to use your 5.2 strategy when applying the 6.3 patches to ma=
ke it looks the same for both versions. Thanks for pointing this out!</p>
<p>BR Petter</p>
<pre>&nbsp;</pre>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
<pre><br /><br /><br /></pre>
</body></html>

--=_282d5000b05e3f9b2be16d0019803cfc--
