Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [78.47.125.74])
	by mail.openembedded.org (Postfix) with ESMTP id 0B73976FFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 13:30:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 9B04F340529;
	Wed, 27 Jan 2016 13:30:59 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id D79BubFk-knt; Wed, 27 Jan 2016 13:30:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 0F0DD340538;
	Wed, 27 Jan 2016 13:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id cKgecK-Ocg-0; Wed, 27 Jan 2016 13:30:57 +0000 (UTC)
Received: from evm-mail-1.efficios.com (evm-mail-1.efficios.com [78.47.125.74])
	by mail.efficios.com (Postfix) with ESMTP id DB1F3340529;
	Wed, 27 Jan 2016 13:30:57 +0000 (UTC)
Date: Wed, 27 Jan 2016 13:30:57 +0000 (UTC)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <809092932.5736.1453901457659.JavaMail.zimbra@efficios.com>
In-Reply-To: <883932458.5623.1453895978760.JavaMail.zimbra@efficios.com>
References: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
	<51287CFC-6F3C-43B1-9190-84F3B20C192E@gmail.com>
	<433937130.5072.1453838389504.JavaMail.zimbra@efficios.com>
	<CAMKF1sofnyADcNkAc+YrXjPED=ALxf60oPEsuQiJTAY87oB31Q@mail.gmail.com>
	<CAJTo0LZazTzkp94ASdACaBOuC4JpNWCpnf46kAucjY5B+wX2vQ@mail.gmail.com>
	<883932458.5623.1453895978760.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
X-Originating-IP: [78.47.125.74]
X-Mailer: Zimbra 8.6.0_GA_1178 (ZimbraWebClient - FF43 (Linux)/8.6.0_GA_1178)
Thread-Topic: Bogus openembedded gcc patch
Thread-Index: CaEJUMCRK3cdkB5jLdTSqPyGskdd6hQytqrP
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [lttng-dev] Bogus openembedded gcc patch
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
X-List-Received-Date: Wed, 27 Jan 2016 13:31:01 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_5735_1906414831.1453901457658"

------=_Part_5735_1906414831.1453901457658
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- On Jan 27, 2016, at 6:59 AM, Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote: 

> ----- On Jan 27, 2016, at 6:31 AM, Burton, Ross <ross.burton@intel.com> wrote:

>> On 26 January 2016 at 23:14, Khem Raj < raj.khem@gmail.com > wrote:

>>> > Yes, we have narrowed down our problem to this specific patch by
>>> > removing the patch from the OE gcc patches, rebuilding gcc, and
>>> > then building our test program with that gcc. The problem goes
>>> > away when we do so, which points directly to that patch as a
>>> > culprit.

>>> > Test program is attached.

>>> Ok I think we can remove this from master and jethro release

>> Mathieu, as you found this do you want the glory by submitting a the removal
>> patch?

> Thanks for asking, but for me a

> Reported-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

> in the patch commit messge is good enough.
> You'll probably want to have a link to this discussion thread
> also in the commit message.

I have a few minutes in front of me, I'll prepare a patch. 

Thanks, 

Mathieu 

> Thanks,

> Mathieu

>> Cheerss,
>> Ross

> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

> _______________________________________________
> lttng-dev mailing list
> lttng-dev@lists.lttng.org
> http://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev

-- 
Mathieu Desnoyers 
EfficiOS Inc. 
http://www.efficios.com 

------=_Part_5735_1906414831.1453901457658
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div><span id=3D"zwchr" data-marker=3D"__DIVIDER=
__">----- On Jan 27, 2016, at 6:59 AM, Mathieu Desnoyers &lt;mathieu.desnoy=
ers@efficios.com&gt; wrote:<br></span></div><div data-marker=3D"__QUOTED_TE=
XT__"><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;pa=
dding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decorat=
ion:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><div style=
=3D"font-family: arial, helvetica, sans-serif; font-size: 12pt; color: #000=
000"><div><span id=3D"zwchr">----- On Jan 27, 2016, at 6:31 AM, Burton, Ros=
s &lt;ross.burton@intel.com&gt; wrote:<br></span></div><div><blockquote sty=
le=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:=
#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:=
Helvetica,Arial,sans-serif;font-size:12pt;"><div dir=3D"ltr"><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 26 January 2016 at 23:14, Kh=
em Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":aj" class=3D"a3s" style=3D"overflow:hidden">&gt; =
Yes, we have narrowed down our problem to this specific patch by<br>
&gt; removing the patch from the OE gcc patches, rebuilding gcc, and<br>
&gt; then building our test program with that gcc. The problem goes<br>
&gt; away when we do so, which points directly to that patch as a<br>
&gt; culprit.<br>
&gt;<br>
&gt; Test program is attached.<p dir=3D"ltr">Ok I think we can remove this =
from master and jethro release<br></p></div></blockquote></div><br>Mathieu,=
 as you found this do you want the glory by submitting a the removal patch?=
</div></div></blockquote><br><div>Thanks for asking, but for me a<br></div>=
<br><div>Reported-by: Mathieu Desnoyers &lt;mathieu.desnoyers@efficios.com&=
gt;<br></div><br><div>in the patch commit messge is good enough.<br></div><=
div>You'll probably want to have a link to this discussion thread<br></div>=
<div>also in the commit message.</div></div></div></blockquote><div><br></d=
iv><div>I have a few minutes in front of me, I'll prepare a patch.<br data-=
mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>Thanks,<br d=
ata-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>Mathieu<=
br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><blockquo=
te style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;=
color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-f=
amily:Helvetica,Arial,sans-serif;font-size:12pt;"><div style=3D"font-family=
: arial, helvetica, sans-serif; font-size: 12pt; color: #000000"><div><div>=
<br></div><br><div>Thanks,<br></div><br><div>Mathieu<br></div><br><blockquo=
te style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;=
color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-f=
amily:Helvetica,Arial,sans-serif;font-size:12pt;"><div dir=3D"ltr"><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheerss,</div><div =
class=3D"gmail_extra">Ross</div></div><br></blockquote></div><br><div>-- <b=
r></div><div>Mathieu Desnoyers<br>EfficiOS Inc.<br>http://www.efficios.com<=
/div></div><br>_______________________________________________<br>lttng-dev=
 mailing list<br>lttng-dev@lists.lttng.org<br>http://lists.lttng.org/cgi-bi=
n/mailman/listinfo/lttng-dev<br></blockquote></div><div><br></div><div data=
-marker=3D"__SIG_POST__">-- <br></div><div>Mathieu Desnoyers<br>EfficiOS In=
c.<br>http://www.efficios.com</div></div></body></html>

------=_Part_5735_1906414831.1453901457658--
