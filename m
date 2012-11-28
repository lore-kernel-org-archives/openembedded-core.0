Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tdnm5-0002cW-JH
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 20:58:29 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so14718112ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mNKTOY0u+7E2AXAkU0Gf+DKSUqqoHxX90IZCwufYK/Q=;
	b=tNZD4+PFyHxNjEO6qCilR7e0GyUCXoOPh/oM4ZfI+lW9AUWFggitL+CuXzWjfV2pcZ
	UGLcGg0YUnJSZJLrjRb8IhI/54EMvWGKTlv336AO2tIuD7KSjNmW56hIjXQtOsw85Kjw
	zSyZrqtHoZApw2GPfSHDPgS4Qkb2113v0c9Qb5yk1Wq1jJHbJm31XXAntqThGLd9uXSD
	U/MuJTTXtgpPfVlzPCMRSrtD7ReCNtEXLidjFnC2iaWbTR+vJ/pF1OSAdjAs65kXWerI
	+xmzzdOSjLHLVZMBQjrkCLeLwqXhaLK5a2m3J0XPCLWCkaWtEKs9HzX78YW+3uao5cXU
	mQ5A==
Received: by 10.50.202.3 with SMTP id ke3mr22708488igc.49.1354131850308; Wed,
	28 Nov 2012 11:44:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 28 Nov 2012 11:43:40 -0800 (PST)
In-Reply-To: <50B6652E.8060306@linux.intel.com>
References: <CAMKF1sqEyMsmSAOtZkv2JGKhfByADi0eJ-jA5E+aY_1tsh1XgQ@mail.gmail.com>
	<50B6652E.8060306@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2012 11:43:40 -0800
Message-ID: <CAMKF1sopwPYzEsD8S0MmyH=7V+9cuV-oo+KdXRQj3Q9fO8ppRA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build logs of all images in or-core
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
X-List-Received-Date: Wed, 28 Nov 2012 19:58:29 -0000
Content-Type: multipart/alternative; boundary=f46d0447882deaacd304cf93635f

--f46d0447882deaacd304cf93635f
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 28, 2012 at 11:25 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 11/28/2012 11:06 AM, Khem Raj wrote:
>
>> Hi All,
>>
>> On an idle machine. I ran all possible image builds
>> for supported qemu arches in OE-Core. Not all the images built
>> successfully. I have posted the logs
>> here
>>
>>
> Thanks for doing that, I guess it's a little different than the
> Autobuilder, so most images should build.
>
>
yes I am using just oe-core standalone. no more layers



> Can you give us a clue about what did not build?
>
>
I have pruned the logs and moved the failed build logs to

http://sakrah.dontexist.org/files/oe-core/failed/


> Thanks
>
>         Sau!
>
>  http://sakrah.dontexist.org/**files/oe-core/<http://sakrah.dontexist.org/files/oe-core/>
>>
>> if anyone wants to take a look
>>
>> -Khem
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>

--f46d0447882deaacd304cf93635f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace"><br></font></font><div class=3D"=
gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 28, 2012 at 11:=
25 AM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.co=
m" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 11/28/2012 11:06 AM, Khem Raj wrote:<=
br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi All,<br>
<br>
On an idle machine. I ran all possible image builds<br>
for supported qemu arches in OE-Core. Not all the images built<br>
successfully. I have posted the logs<br>
here<br>
<br>
</blockquote>
<br></div>
Thanks for doing that, I guess it&#39;s a little different than the Autobui=
lder, so most images should build.<br>
<br></blockquote><div><br></div><div>yes I am using just oe-core standalone=
. no more layers</div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">


Can you give us a clue about what did not build?<br>
<br></blockquote><div><br></div><div>I have pruned the logs and moved the f=
ailed build logs to</div><div><br></div><div><a href=3D"http://sakrah.donte=
xist.org/files/oe-core/failed/">http://sakrah.dontexist.org/files/oe-core/f=
ailed/</a><br>

</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex">
Thanks<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">
<a href=3D"http://sakrah.dontexist.org/files/oe-core/" target=3D"_blank">ht=
tp://sakrah.dontexist.org/<u></u>files/oe-core/</a><br>
<br>
if anyone wants to take a look<br>
<br>
-Khem<br>
<br>
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
</blockquote>
</blockquote></div><br></div>

--f46d0447882deaacd304cf93635f--
