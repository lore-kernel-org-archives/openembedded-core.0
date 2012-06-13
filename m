Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Seih9-0005A6-OJ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 10:12:52 +0200
Received: by yenl13 with SMTP id l13so246370yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UZDJ/HJZndU/fQMgSixS9CrKPJpXtPaUq6OfAZjdllE=;
	b=CgD1QfaxYbsQqAKEIp3i8KbN5WXBCV8+u1f6PSPvcyNVgK9k4NVKewy5rCOLChweCK
	xApv7FlJlhHOp4cZuH1J1rDg/it+a3zaFVL2bNL8qjzHqmM6BFFqPVofTmBcP2A0hS7b
	UdIgPkCZUuGm6S5NmPudFvXBfYXqEzztwF5UOrfjj1VnGwQnY8Gx4lK8BMleSAI5Dwrs
	BuKLKth8k1wZTQYl4eHfTGklUyQhCPJrYFFlGjyOgeqPa+FjU9xVEOQ1+sHsttEAmJAl
	PjeVr3RG9LaESS896/0OCAeHCDS3NQ3oveukDZBSiosHwrWtG+LgyaiuL5tdY3JeAx5X
	qoQw==
MIME-Version: 1.0
Received: by 10.50.47.166 with SMTP id e6mr9909351ign.55.1339574535585; Wed,
	13 Jun 2012 01:02:15 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 13 Jun 2012 01:02:15 -0700 (PDT)
In-Reply-To: <4FD78DDA.5010907@windriver.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
	<4FD78DDA.5010907@windriver.com>
Date: Wed, 13 Jun 2012 10:02:15 +0200
Message-ID: <CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 08:12:52 -0000
Content-Type: multipart/alternative; boundary=14dae934080757fec504c256006a

--14dae934080757fec504c256006a
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem, Mark,

I've not changed the location of the local repository since it was created
months ago.
This problem appeared yesterday and I cannot find a why.
For information, I'm on a FC14 host machine and the repository is on a
physical hdd and not
mounted from NFS for example.

Cheers,
Giuseppe



2012/6/12 Mark Hatle <mark.hatle@windriver.com>

> On 6/12/12 8:57 AM, Khem Raj wrote:
>
>> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com**>  wrote:
>>
>>> OSError: [Errno 1] Operation not permitted:
>>> '/oelinux/condorg/**openembedded-core/stlinux-3.0-**
>>> build/tmp-uclibc/work/sh4-oe-**linux-uclibc/linux-libc-**
>>> headers-2.6.32-r1/package/usr'
>>>
>>
>> what is your host machine ? did you also update bitbake ?
>>
>
> It also could be the filesystem.  What filesystem type are you using?  (on
> the host system...)  If you are using something like fat32, you may run
> into problems like this because it does not have the ability to change
> permissions and modes.. since the underlying filesystem does not support
> them.
>
> --Mark
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--14dae934080757fec504c256006a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem, Mark,</div><div>=A0</div><div>I&#39;ve not changed the locati=
on of the local repository since it was created months ago.</div><div>This =
problem appeared yesterday and I cannot find a why.</div><div>For informati=
on, I&#39;m on a FC14 host machine and the repository is on a physical hdd =
and not</div>
<div>mounted from NFS for example.</div><div>=A0</div><div>Cheers,</div><di=
v>Giuseppe</div><div><br><br>=A0</div><div class=3D"gmail_quote">2012/6/12 =
Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com=
" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On 6/12/12 8:57 AM, Khem Raj wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank">gius=
eppe.condorelli@gmail.com</a><u></u>&gt; =A0wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
OSError: [Errno 1] Operation not permitted:<br>
&#39;/oelinux/condorg/<u></u>openembedded-core/stlinux-3.0-<u></u>build/tmp=
-uclibc/work/sh4-oe-<u></u>linux-uclibc/linux-libc-<u></u>headers-2.6.32-r1=
/package/usr&#39;<br>
</blockquote>
<br>
what is your host machine ? did you also update bitbake ?<br>
</blockquote>
<br></div>
It also could be the filesystem. =A0What filesystem type are you using? =A0=
(on the host system...) =A0If you are using something like fat32, you may r=
un into problems like this because it does not have the ability to change p=
ermissions and modes.. since the underlying filesystem does not support the=
m.<span class=3D"HOEnZb"><font color=3D"#888888"><br>

<br>
--Mark</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae934080757fec504c256006a--
