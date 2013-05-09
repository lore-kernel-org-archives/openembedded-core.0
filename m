Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UaGns-0004Q2-GQ
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 04:42:04 +0200
Received: by mail-la0-f54.google.com with SMTP id fd20so2395219lab.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 19:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Fozzs/IDHOSNZbtCmD+P+DVG68y7wwO5HIkzxPd8ylU=;
	b=ILJZ09kjA3JECo1Cg0LinTRhvMrnuUh3e1i5zAdi5udcMN4Y2YxIQYBxQmds9to6Oq
	FhCghD3aqbcPe+fZrmc3hp4HkhgdAS2XH24oOzEQKLTTFcq83Up75xJRLAZL9Qalxfm3
	h8NwOJKZszgYe6dcKvmoYQewDd4XYsZc5Z6HiOTgFJ7un9XYaETIsRQitsO71Jk/bXwN
	U9+zoloiTTlEqssO4eoPL7N5Mz1acS9auLwQyQYoq181NZzxmzqGC3dJNECp8Exi0u6p
	P4Gjr/4DPq8SvsUPmFb2NNCCgTf9ACKyXiDsVQppyC+LWhr+WOJ0I95tWmIX9vB35V4E
	T3Qw==
X-Received: by 10.152.26.65 with SMTP id j1mr4375806lag.42.1368066233343; Wed,
	08 May 2013 19:23:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.143.100 with HTTP; Wed, 8 May 2013 19:23:33 -0700 (PDT)
In-Reply-To: <518B06A2.6000708@windriver.com>
References: <cover.1368002042.git.liezhi.yang@windriver.com>
	<ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
	<518A3EF8.20807@topic.nl> <518B06A2.6000708@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 8 May 2013 19:23:33 -0700
X-Google-Sender-Auth: S_t4X4QRyf5fvsOiMxmfxyqBgsg
Message-ID: <CABcZANmKO+dpRti22tAuHP4bMbwyYDY6B52kDkUZqhdASGx1Rg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bbclass: bb.fatal() clean up
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 02:42:10 -0000
Content-Type: multipart/alternative; boundary=089e0158c3e0de258404dc3fbd92

--089e0158c3e0de258404dc3fbd92
Content-Type: text/plain; charset=UTF-8

On Wed, May 8, 2013 at 7:14 PM, Robert Yang <liezhi.yang@windriver.com>wrote:

> On 05/08/2013 08:03 PM, Mike Looijmans wrote:
>
>> On 05/08/2013 11:06 AM, Robert Yang wrote:
>>
>>> The bb.fatal() is defined as:
>>>
>>> def fatal(*args):
>>>      logger.critical(''.join(args))
>>>      sys.exit(1)
>>>
>>> So anything after bb.fatal() in the same code block doesn't have any
>>> effect, e.g.:
>>>
>>>      bb.fatal("%s_%s: %s" % (var, pkg, e))
>>>      raise e
>>>
>>> The "raise e" should be removed.
>>>
>>
>> Just some random thoughts that occurred to me when I read this:
>>
>>
> Hi Mike, thanks for your comments, but the "raise sys.exit(1)" doesn't
> raise
> anything, e.g.:
>
> import sys
>
> def fatal():
>         sys.exit(1)
>
> try:
>         raise fatal()
> except Exception as e:
>         raise e
>
> I think that the "raise fatal()" equals to "fatal()" here.


He didn't say raise sys.exit(1), he said sys.exit(1) is equivalent to raise
SystemExit(1), which it is.
-- 
Christopher Larson

--089e0158c3e0de258404dc3fbd92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 8, 2013 at 7:14 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 05/08/2013 08:03 PM, Mi=
ke Looijmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 05/08/2013 11:06 AM, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The bb.fatal() is defined as:<br>
<br>
def fatal(*args):<br>
=C2=A0 =C2=A0 =C2=A0logger.critical(&#39;&#39;.join(args))<br>
=C2=A0 =C2=A0 =C2=A0sys.exit(1)<br>
<br>
So anything after bb.fatal() in the same code block doesn&#39;t have any<br=
>
effect, e.g.:<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;%s_%s: %s&quot; % (var, pkg, e))<br>
=C2=A0 =C2=A0 =C2=A0raise e<br>
<br>
The &quot;raise e&quot; should be removed.<br>
</blockquote>
<br>
Just some random thoughts that occurred to me when I read this:<br>
<br>
</blockquote>
<br></div>
Hi Mike, thanks for your comments, but the &quot;raise sys.exit(1)&quot; do=
esn&#39;t raise<br>
anything, e.g.:<br>
<br>
import sys<br>
<br>
def fatal():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
<br>
try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise fatal()<br>
except Exception as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise e<br>
<br>
I think that the &quot;raise fatal()&quot; equals to &quot;fatal()&quot; he=
re.</blockquote></div><br>He didn&#39;t say raise sys.exit(1), he said sys.=
exit(1) is equivalent to raise SystemExit(1), which it is.<br>-- <br>Christ=
opher Larson</div>

</div>

--089e0158c3e0de258404dc3fbd92--
