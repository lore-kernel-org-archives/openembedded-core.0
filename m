Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id D46E16FD21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 17:23:50 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so1964398qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vgv3vmzwsQJhxb23i+JVfRao9JVh/qTeqTU8gUkKoG4=;
	b=riQe29Jr3pa8PUdFYY9rwTEAOBM7WLUBhXA0LfId/w1C9pXQaCTP/dZD/afOoEIE2D
	+rNWCZDkYNdZacirNoHVaczhAMkrDgcdLoUyYu+nKfg2d1/za8uyNCcv+CbTnIlpkldT
	9ckahLTmHaQ5ghD0vimSEJ80cBY23wc7AE7xJPj1Uzi34AqgpXiVCw8hKwgH6o7RorMz
	nE+7XKTt/hoZQZ7A96nQHk9+XGKlprQerJpm63Y4nM+BVpSFwJX+hXlqc7UCMJX5J62r
	7mbphRNnPh7hNbqEPq2CdcuYmj3PkZFZRyDok+d5uTP0ZZ8J/1JJI/Sn+CnxMuinu9+H
	/fow==
X-Received: by 10.140.86.178 with SMTP id p47mr11807943qgd.66.1401384231107;
	Thu, 29 May 2014 10:23:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 29 May 2014 10:23:29 -0700 (PDT)
In-Reply-To: <5387654C.5090309@linux.intel.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
	<5387654C.5090309@linux.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 29 May 2014 14:23:29 -0300
Message-ID: <CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 17:23:53 -0000
X-Groupsio-MsgNum: 53684
Content-Type: multipart/mixed; boundary=001a11c13d5c4a519d04fa8d311a

--001a11c13d5c4a519d04fa8d311a
Content-Type: multipart/alternative; boundary=001a11c13d5c4a519804fa8d3118

--001a11c13d5c4a519804fa8d3118
Content-Type: text/plain; charset=ISO-8859-1

Sau!,

On Thu, May 29, 2014 at 1:50 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/29/2014 09:36 AM, Diego Sueiro wrote:
>
>> Hi Sau!,
>>
>> On Thu, May 29, 2014 at 12:20 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>  On 05/29/2014 06:17 AM, Diego Sueiro wrote:
>>>
>>>  Folks,
>>>>
>>>> I'm facing with a strange error on daisy branch.
>>>> Some native recipes are failing on do_configure step with this message:
>>>>
>>>> checking for intltool >= 0.35.0...
>>>> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>>>> configure: error: Your intltool is too old.  You need intltool 0.35.0 or
>>>> later.
>>>> Configure failed. The contents of all config.log files follows to aid
>>>> debugging
>>>>
>>>>
>>>> But intltool-native version is 0.50.2.
>>>> What am I missing?
>>>>
>>>>
>>>>   What is your Host OS in this case, it seems like you might be having
>>>>
>>> somekind of host contamination issue.
>>>
>>>
>> Ubuntu 14.04 x86_64. I have installed intltools (0.50.2) on host too.
>>
>>
>>  Can you also look at your config.log and see what it was actually testing
>>> for.
>>>
>>>
>> Do you mean the recipe's log.do_configure?
>>
>>  No I mean the actual config.log file from the configure process.  Also,
> I forgot to ask what's the recipe (if it's public).  It's also possible
> that the package's configure is looking for a more precise match and we are
> actually too new!
>
> For now these are the recipes:

shared-mime-info_1.2.bb
gconf_3.2.6.bb
libsoup-2.4_2.45.3.bb
gconf_3.2.6.bb
avahi_0.6.31.bb
xkeyboard-config_2.11.bb
libfm_1.1.2.2.bb
glib-networking_2.38.0.bb
connman-gnome_0.7.bb


Find attached the config.log for shared-mime-info-native.

I had recently update my Ubuntu from 12.10 to 14.04. Do you think it can
cause this error?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c13d5c4a519804fa8d3118
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Sau!,</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Thu, May 29, 2014 at 1:50 PM, Saul=
 Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"">On 05/29/2014 09:36 AM, Diego Sueiro wrote=
:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi Sau!,<br>
<br>
On Thu, May 29, 2014 at 12:20 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux=
.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
On 05/29/2014 06:17 AM, Diego Sueiro wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Folks,<br>
<br>
I&#39;m facing with a strange error on daisy branch.<br>
Some native recipes are failing on do_configure step with this message:<br>
<br>
checking for intltool &gt;=3D 0.35.0...<br>
/&lt;snip&gt;/tmp/sysroots/x86_64-<u></u>linux/usr/bin/nativeperl found<br>
configure: error: Your intltool is too old. =A0You need intltool 0.35.0 or<=
br>
later.<br>
Configure failed. The contents of all config.log files follows to aid<br>
debugging<br>
<br>
<br>
But intltool-native version is 0.50.2.<br>
What am I missing?<br>
<br>
<br>
=A0 What is your Host OS in this case, it seems like you might be having<br=
>
</blockquote>
somekind of host contamination issue.<br>
<br>
</blockquote>
<br>
Ubuntu 14.04 x86_64. I have installed intltools (0.50.2) on host too.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Can you also look at your config.log and see what it was actually testing<b=
r>
for.<br>
<br>
</blockquote>
<br>
Do you mean the recipe&#39;s log.do_configure?<br>
<br>
</blockquote></div>
No I mean the actual config.log file from the configure process. =A0Also, I=
 forgot to ask what&#39;s the recipe (if it&#39;s public). =A0It&#39;s also=
 possible that the package&#39;s configure is looking for a more precise ma=
tch and we are actually too new!<br>

<br></blockquote><div>For now these are the recipes:</div></div></div><bloc=
kquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><div><div><a href=3D"http://sha=
red-mime-info_1.2.bb">shared-mime-info_1.2.bb</a></div>

<div><a href=3D"http://gconf_3.2.6.bb">gconf_3.2.6.bb</a></div><div><a href=
=3D"http://libsoup-2.4_2.45.3.bb">libsoup-2.4_2.45.3.bb</a></div><div><a hr=
ef=3D"http://gconf_3.2.6.bb">gconf_3.2.6.bb</a></div><div><a href=3D"http:/=
/avahi_0.6.31.bb">avahi_0.6.31.bb</a></div>

<div><a href=3D"http://xkeyboard-config_2.11.bb">xkeyboard-config_2.11.bb</=
a></div><div><a href=3D"http://libfm_1.1.2.2.bb">libfm_1.1.2.2.bb</a></div>=
<div><a href=3D"http://glib-networking_2.38.0.bb">glib-networking_2.38.0.bb=
</a></div>

<div><a href=3D"http://connman-gnome_0.7.bb">connman-gnome_0.7.bb</a></div>=
</div></div></div></blockquote><div class=3D"gmail_extra"><br>Find attached=
 the config.log for=A0shared-mime-info-native.</div><div class=3D"gmail_ext=
ra">

<br></div><div class=3D"gmail_extra">I had recently update my Ubuntu from 1=
2.10 to 14.04. Do you think it can cause this error?</div><div class=3D"gma=
il_extra"><br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><d=
iv>
<br>
</div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a hr=
ef=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_m=
edium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_bl=
ank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c13d5c4a519804fa8d3118--

--001a11c13d5c4a519d04fa8d311a
Content-Type: text/x-log; charset=US-ASCII; name="shared-mime-info-native.config.log"
Content-Disposition: attachment; 
	filename="shared-mime-info-native.config.log"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hvsbyxub0

VGhpcyBmaWxlIGNvbnRhaW5zIGFueSBtZXNzYWdlcyBwcm9kdWNlZCBieSBjb21waWxlcnMgd2hp
bGUKcnVubmluZyBjb25maWd1cmUsIHRvIGFpZCBkZWJ1Z2dpbmcgaWYgY29uZmlndXJlIG1ha2Vz
IGEgbWlzdGFrZS4KCkl0IHdhcyBjcmVhdGVkIGJ5IHNoYXJlZC1taW1lLWluZm8gY29uZmlndXJl
IDEuMiwgd2hpY2ggd2FzCmdlbmVyYXRlZCBieSBHTlUgQXV0b2NvbmYgMi42OS4gIEludm9jYXRp
b24gY29tbWFuZCBsaW5lIHdhcwoKICAkIC88c25pcD4vdG1wL3dvcmsveDg2XzY0LWxpbnV4L3No
YXJlZC1taW1lLWluZm8tbmF0aXZlLzEuMi1yMC9zaGFyZWQtbWltZS1pbmZvLTEuMi9jb25maWd1
cmUgLS1idWlsZD14ODZfNjQtbGludXggLS1ob3N0PXg4Nl82NC1saW51eCAtLXRhcmdldD14ODZf
NjQtbGludXggLS1wcmVmaXg9LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3VzciAt
LWV4ZWNfcHJlZml4PS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IgLS1iaW5k
aXI9LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4gLS1zYmluZGlyPS88
c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Ivc2JpbiAtLWxpYmV4ZWNkaXI9Lzxz
bmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9saWIvc2hhcmVkLW1pbWUtaW5mbyAt
LWRhdGFkaXI9LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9zaGFyZSAtLXN5
c2NvbmZkaXI9LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2V0YyAtLXNoYXJlZHN0
YXRlZGlyPS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9jb20gLS1sb2NhbHN0YXRl
ZGlyPS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC92YXIgLS1saWJkaXI9Lzxzbmlw
Pi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9saWIgLS1pbmNsdWRlZGlyPS88c25pcD4v
dG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAtLW9sZGluY2x1ZGVkaXI9Lzxz
bmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlIC0taW5mb2Rpcj0vPHNu
aXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL3NoYXJlL2luZm8gLS1tYW5kaXI9Lzxz
bmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9zaGFyZS9tYW4gLS1kaXNhYmxlLXNp
bGVudC1ydWxlcyAtLWRpc2FibGUtZGVwZW5kZW5jeS10cmFja2luZyAtLWRpc2FibGUtdXBkYXRl
LW1pbWVkYiAtLWRpc2FibGUtbmxzCgojIyAtLS0tLS0tLS0gIyMKIyMgUGxhdGZvcm0uICMjCiMj
IC0tLS0tLS0tLSAjIwoKaG9zdG5hbWUgPSBkc3VlaXJvLU40NlZNCnVuYW1lIC1tID0geDg2XzY0
CnVuYW1lIC1yID0gMy4xMy4wLTI3LWdlbmVyaWMKdW5hbWUgLXMgPSBMaW51eAp1bmFtZSAtdiA9
ICM1MC1VYnVudHUgU01QIFRodSBNYXkgMTUgMTg6MDY6MTYgVVRDIDIwMTQKCi91c3IvYmluL3Vu
YW1lIC1wID0gdW5rbm93bgovYmluL3VuYW1lIC1YICAgICA9IHVua25vd24KCi9iaW4vYXJjaCAg
ICAgICAgICAgICAgPSB1bmtub3duCi91c3IvYmluL2FyY2ggLWsgICAgICAgPSB1bmtub3duCi91
c3IvY29udmV4L2dldHN5c2luZm8gPSB1bmtub3duCi91c3IvYmluL2hvc3RpbmZvICAgICAgPSB1
bmtub3duCi9iaW4vbWFjaGluZSAgICAgICAgICAgPSB1bmtub3duCi91c3IvYmluL29zbGV2ZWwg
ICAgICAgPSB1bmtub3duCi9iaW4vdW5pdmVyc2UgICAgICAgICAgPSB1bmtub3duCgpQQVRIOiAv
PHNuaXA+L3NjcmlwdHMvbmF0aXZlLWludGVyY2VwdApQQVRIOiAvPHNuaXA+L3NjcmlwdHMKUEFU
SDogLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4vYXJtdjV0ZS1saW51
eApQQVRIOiAvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2JpbgpQQVRIOiAv
PHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL3NiaW4KUEFUSDogLzxzbmlwPi90
bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4KUEFUSDogLzxzbmlwPi90bXAvc3lzcm9v
dHMveDg2XzY0LWxpbnV4L3NiaW4KUEFUSDogLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxp
bnV4L2JpbgpQQVRIOiAvPHNuaXA+L3NjcmlwdHMKUEFUSDogLzxzbmlwPi9iaXRiYWtlL2JpbgpQ
QVRIOiAvaG9tZS9kc3VlaXJvL2JpbgpQQVRIOiAvaG9tZS9kc3VlaXJvL2JpbgpQQVRIOiAvdXNy
L2xvY2FsL3NiaW4KUEFUSDogL3Vzci9sb2NhbC9iaW4KUEFUSDogL3Vzci9zYmluClBBVEg6IC91
c3IvYmluClBBVEg6IC9zYmluClBBVEg6IC9iaW4KUEFUSDogL3Vzci9nYW1lcwpQQVRIOiAvdXNy
L2xvY2FsL2dhbWVzClBBVEg6IC91c3IvbGliL2p2bS9qYXZhLTgtb3JhY2xlL2JpbgpQQVRIOiAv
dXNyL2xpYi9qdm0vamF2YS04LW9yYWNsZS9kYi9iaW4KUEFUSDogL3Vzci9saWIvanZtL2phdmEt
OC1vcmFjbGUvanJlL2JpbgpQQVRIOiAvaG9tZS9kc3VlaXJvL2VjbGlwc2UKCgojIyAtLS0tLS0t
LS0tLSAjIwojIyBDb3JlIHRlc3RzLiAjIwojIyAtLS0tLS0tLS0tLSAjIwoKY29uZmlndXJlOjIx
MzA6IGxvYWRpbmcgc2l0ZSBzY3JpcHQgLzxzbmlwPi9tZXRhL3NpdGUvbmF0aXZlCnwgYWNfY3Zf
cGF0aF9TRUQ9c2VkCmNvbmZpZ3VyZToyMjcyOiBjaGVja2luZyBmb3IgYSBCU0QtY29tcGF0aWJs
ZSBpbnN0YWxsCmNvbmZpZ3VyZToyMzQwOiByZXN1bHQ6IC91c3IvYmluL2luc3RhbGwgLWMKY29u
ZmlndXJlOjIzNTE6IGNoZWNraW5nIHdoZXRoZXIgYnVpbGQgZW52aXJvbm1lbnQgaXMgc2FuZQpj
b25maWd1cmU6MjQwNjogcmVzdWx0OiB5ZXMKY29uZmlndXJlOjI1NTc6IGNoZWNraW5nIGZvciBh
IHRocmVhZC1zYWZlIG1rZGlyIC1wCmNvbmZpZ3VyZToyNTk2OiByZXN1bHQ6IC9iaW4vbWtkaXIg
LXAKY29uZmlndXJlOjI2MDM6IGNoZWNraW5nIGZvciBnYXdrCmNvbmZpZ3VyZToyNjE5OiBmb3Vu
ZCAvdXNyL2Jpbi9nYXdrCmNvbmZpZ3VyZToyNjMwOiByZXN1bHQ6IGdhd2sKY29uZmlndXJlOjI2
NDE6IGNoZWNraW5nIHdoZXRoZXIgbWFrZSBzZXRzICQoTUFLRSkKY29uZmlndXJlOjI2NjM6IHJl
c3VsdDogeWVzCmNvbmZpZ3VyZToyNjkyOiBjaGVja2luZyB3aGV0aGVyIG1ha2Ugc3VwcG9ydHMg
bmVzdGVkIHZhcmlhYmxlcwpjb25maWd1cmU6MjcwOTogcmVzdWx0OiB5ZXMKY29uZmlndXJlOjI4
NTA6IGNoZWNraW5nIHdoZXRoZXIgbWFrZSBzdXBwb3J0cyBuZXN0ZWQgdmFyaWFibGVzCmNvbmZp
Z3VyZToyODY3OiByZXN1bHQ6IHllcwpjb25maWd1cmU6Mjg4NzogY2hlY2tpbmcgZm9yIHg4Nl82
NC1saW51eC1nY2MKY29uZmlndXJlOjI5MTQ6IHJlc3VsdDogZ2NjIApjb25maWd1cmU6MzE4Mzog
Y2hlY2tpbmcgZm9yIEMgY29tcGlsZXIgdmVyc2lvbgpjb25maWd1cmU6MzE5MjogZ2NjICAtLXZl
cnNpb24gPiY1CmdjYyAoVWJ1bnR1IDQuOC4yLTE5dWJ1bnR1MSkgNC44LjIKQ29weXJpZ2h0IChD
KSAyMDEzIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgpUaGlzIGlzIGZyZWUgc29mdHdh
cmU7IHNlZSB0aGUgc291cmNlIGZvciBjb3B5aW5nIGNvbmRpdGlvbnMuICBUaGVyZSBpcyBOTwp3
YXJyYW50eTsgbm90IGV2ZW4gZm9yIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4KCmNvbmZpZ3VyZTozMjAzOiAkPyA9IDAKY29uZmlndXJlOjMxOTI6
IGdjYyAgLXYgPiY1ClVzaW5nIGJ1aWx0LWluIHNwZWNzLgpDT0xMRUNUX0dDQz1nY2MKQ09MTEVD
VF9MVE9fV1JBUFBFUj0vdXNyL2xpYi9nY2MveDg2XzY0LWxpbnV4LWdudS80LjgvbHRvLXdyYXBw
ZXIKVGFyZ2V0OiB4ODZfNjQtbGludXgtZ251CkNvbmZpZ3VyZWQgd2l0aDogLi4vc3JjL2NvbmZp
Z3VyZSAtdiAtLXdpdGgtcGtndmVyc2lvbj0nVWJ1bnR1IDQuOC4yLTE5dWJ1bnR1MScgLS13aXRo
LWJ1Z3VybD1maWxlOi8vL3Vzci9zaGFyZS9kb2MvZ2NjLTQuOC9SRUFETUUuQnVncyAtLWVuYWJs
ZS1sYW5ndWFnZXM9YyxjKyssamF2YSxnbyxkLGZvcnRyYW4sb2JqYyxvYmotYysrIC0tcHJlZml4
PS91c3IgLS1wcm9ncmFtLXN1ZmZpeD0tNC44IC0tZW5hYmxlLXNoYXJlZCAtLWVuYWJsZS1saW5r
ZXItYnVpbGQtaWQgLS1saWJleGVjZGlyPS91c3IvbGliIC0td2l0aG91dC1pbmNsdWRlZC1nZXR0
ZXh0IC0tZW5hYmxlLXRocmVhZHM9cG9zaXggLS13aXRoLWd4eC1pbmNsdWRlLWRpcj0vdXNyL2lu
Y2x1ZGUvYysrLzQuOCAtLWxpYmRpcj0vdXNyL2xpYiAtLWVuYWJsZS1ubHMgLS13aXRoLXN5c3Jv
b3Q9LyAtLWVuYWJsZS1jbG9jYWxlPWdudSAtLWVuYWJsZS1saWJzdGRjeHgtZGVidWcgLS1lbmFi
bGUtbGlic3RkY3h4LXRpbWU9eWVzIC0tZW5hYmxlLWdudS11bmlxdWUtb2JqZWN0IC0tZGlzYWJs
ZS1saWJtdWRmbGFwIC0tZW5hYmxlLXBsdWdpbiAtLXdpdGgtc3lzdGVtLXpsaWIgLS1kaXNhYmxl
LWJyb3dzZXItcGx1Z2luIC0tZW5hYmxlLWphdmEtYXd0PWd0ayAtLWVuYWJsZS1ndGstY2Fpcm8g
LS13aXRoLWphdmEtaG9tZT0vdXNyL2xpYi9qdm0vamF2YS0xLjUuMC1nY2otNC44LWFtZDY0L2py
ZSAtLWVuYWJsZS1qYXZhLWhvbWUgLS13aXRoLWp2bS1yb290LWRpcj0vdXNyL2xpYi9qdm0vamF2
YS0xLjUuMC1nY2otNC44LWFtZDY0IC0td2l0aC1qdm0tamFyLWRpcj0vdXNyL2xpYi9qdm0tZXhw
b3J0cy9qYXZhLTEuNS4wLWdjai00LjgtYW1kNjQgLS13aXRoLWFyY2gtZGlyZWN0b3J5PWFtZDY0
IC0td2l0aC1lY2otamFyPS91c3Ivc2hhcmUvamF2YS9lY2xpcHNlLWVjai5qYXIgLS1lbmFibGUt
b2JqYy1nYyAtLWVuYWJsZS1tdWx0aWFyY2ggLS1kaXNhYmxlLXdlcnJvciAtLXdpdGgtYXJjaC0z
Mj1pNjg2IC0td2l0aC1hYmk9bTY0IC0td2l0aC1tdWx0aWxpYi1saXN0PW0zMixtNjQsbXgzMiAt
LXdpdGgtdHVuZT1nZW5lcmljIC0tZW5hYmxlLWNoZWNraW5nPXJlbGVhc2UgLS1idWlsZD14ODZf
NjQtbGludXgtZ251IC0taG9zdD14ODZfNjQtbGludXgtZ251IC0tdGFyZ2V0PXg4Nl82NC1saW51
eC1nbnUKVGhyZWFkIG1vZGVsOiBwb3NpeApnY2MgdmVyc2lvbiA0LjguMiAoVWJ1bnR1IDQuOC4y
LTE5dWJ1bnR1MSkgCmNvbmZpZ3VyZTozMjAzOiAkPyA9IDAKY29uZmlndXJlOjMxOTI6IGdjYyAg
LVYgPiY1CmdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICctVicK
Z2NjOiBmYXRhbCBlcnJvcjogbm8gaW5wdXQgZmlsZXMKY29tcGlsYXRpb24gdGVybWluYXRlZC4K
Y29uZmlndXJlOjMyMDM6ICQ/ID0gNApjb25maWd1cmU6MzE5MjogZ2NjICAtcXZlcnNpb24gPiY1
CmdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICctcXZlcnNpb24n
CmdjYzogZmF0YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
CmNvbmZpZ3VyZTozMjAzOiAkPyA9IDQKY29uZmlndXJlOjMyMjM6IGNoZWNraW5nIHdoZXRoZXIg
dGhlIEMgY29tcGlsZXIgd29ya3MKY29uZmlndXJlOjMyNDU6IGdjYyAgLWlzeXN0ZW0vPHNuaXA+
L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUgLU8yIC1waXBlIC1pc3lzdGVt
LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlIC1MLzxzbmlwPi90
bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9saWIgLUwvPHNuaXA+L3RtcC9zeXNyb290cy94
ODZfNjQtbGludXgvbGliIC1XbCwtcnBhdGgtbGluaywvPHNuaXA+L3RtcC9zeXNyb290cy94ODZf
NjQtbGludXgvdXNyL2xpYiAtV2wsLXJwYXRoLWxpbmssLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2
XzY0LWxpbnV4L2xpYiAtV2wsLXJwYXRoLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51
eC91c3IvbGliIC1XbCwtcnBhdGgsLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xp
YiAtV2wsLU8xIGNvbmZ0ZXN0LmMgID4mNQpjb25maWd1cmU6MzI0OTogJD8gPSAwCmNvbmZpZ3Vy
ZTozMjk3OiByZXN1bHQ6IHllcwpjb25maWd1cmU6MzMwMDogY2hlY2tpbmcgZm9yIEMgY29tcGls
ZXIgZGVmYXVsdCBvdXRwdXQgZmlsZSBuYW1lCmNvbmZpZ3VyZTozMzAyOiByZXN1bHQ6IGEub3V0
CmNvbmZpZ3VyZTozMzA4OiBjaGVja2luZyBmb3Igc3VmZml4IG9mIGV4ZWN1dGFibGVzCmNvbmZp
Z3VyZTozMzE1OiBnY2MgIC1vIGNvbmZ0ZXN0IC1pc3lzdGVtLzxzbmlwPi90bXAvc3lzcm9vdHMv
eDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlIC1PMiAtcGlwZSAtaXN5c3RlbS88c25pcD4vdG1wL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAtTC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4
Nl82NC1saW51eC91c3IvbGliIC1MLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xp
YiAtV2wsLXJwYXRoLWxpbmssLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9s
aWIgLVdsLC1ycGF0aC1saW5rLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9saWIg
LVdsLC1ycGF0aCwvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYiAtV2ws
LXJwYXRoLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9saWIgLVdsLC1PMSBjb25m
dGVzdC5jICA+JjUKY29uZmlndXJlOjMzMTk6ICQ/ID0gMApjb25maWd1cmU6MzM0MTogcmVzdWx0
OiAKY29uZmlndXJlOjMzNjM6IGNoZWNraW5nIHdoZXRoZXIgd2UgYXJlIGNyb3NzIGNvbXBpbGlu
Zwpjb25maWd1cmU6MzM3MTogZ2NjICAtbyBjb25mdGVzdCAtaXN5c3RlbS88c25pcD4vdG1wL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZSAtTzIgLXBpcGUgLWlzeXN0ZW0vPHNuaXA+
L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUgLUwvPHNuaXA+L3RtcC9zeXNy
b290cy94ODZfNjQtbGludXgvdXNyL2xpYiAtTC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1s
aW51eC9saWIgLVdsLC1ycGF0aC1saW5rLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51
eC91c3IvbGliIC1XbCwtcnBhdGgtbGluaywvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGlu
dXgvbGliIC1XbCwtcnBhdGgsLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9s
aWIgLVdsLC1ycGF0aCwvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvbGliIC1XbCwt
TzEgY29uZnRlc3QuYyAgPiY1CmNvbmZpZ3VyZTozMzc1OiAkPyA9IDAKY29uZmlndXJlOjMzODI6
IC4vY29uZnRlc3QKY29uZmlndXJlOjMzODY6ICQ/ID0gMApjb25maWd1cmU6MzQwMTogcmVzdWx0
OiBubwpjb25maWd1cmU6MzQwNjogY2hlY2tpbmcgZm9yIHN1ZmZpeCBvZiBvYmplY3QgZmlsZXMK
Y29uZmlndXJlOjM0Mjg6IGdjYyAgLWMgLWlzeXN0ZW0vPHNuaXA+L3RtcC9zeXNyb290cy94ODZf
NjQtbGludXgvdXNyL2luY2x1ZGUgLU8yIC1waXBlIC1pc3lzdGVtLzxzbmlwPi90bXAvc3lzcm9v
dHMveDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlIGNvbmZ0ZXN0LmMgPiY1CmNvbmZpZ3VyZTozNDMy
OiAkPyA9IDAKY29uZmlndXJlOjM0NTM6IHJlc3VsdDogbwpjb25maWd1cmU6MzQ1NzogY2hlY2tp
bmcgd2hldGhlciB3ZSBhcmUgdXNpbmcgdGhlIEdOVSBDIGNvbXBpbGVyCmNvbmZpZ3VyZTozNDc2
OiBnY2MgIC1jIC1pc3lzdGVtLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9p
bmNsdWRlIC1PMiAtcGlwZSAtaXN5c3RlbS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51
eC91c3IvaW5jbHVkZSBjb25mdGVzdC5jID4mNQpjb25maWd1cmU6MzQ3NjogJD8gPSAwCmNvbmZp
Z3VyZTozNDg1OiByZXN1bHQ6IHllcwpjb25maWd1cmU6MzQ5NDogY2hlY2tpbmcgd2hldGhlciBn
Y2MgIGFjY2VwdHMgLWcKY29uZmlndXJlOjM1MTQ6IGdjYyAgLWMgLWcgLWlzeXN0ZW0vPHNuaXA+
L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUgY29uZnRlc3QuYyA+JjUKY29u
ZmlndXJlOjM1MTQ6ICQ/ID0gMApjb25maWd1cmU6MzU1NTogcmVzdWx0OiB5ZXMKY29uZmlndXJl
OjM1NzI6IGNoZWNraW5nIGZvciBnY2MgIG9wdGlvbiB0byBhY2NlcHQgSVNPIEM4OQpjb25maWd1
cmU6MzYzNTogZ2NjICAgLWMgLWlzeXN0ZW0vPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGlu
dXgvdXNyL2luY2x1ZGUgLU8yIC1waXBlIC1pc3lzdGVtLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2
XzY0LWxpbnV4L3Vzci9pbmNsdWRlIGNvbmZ0ZXN0LmMgPiY1CmNvbmZpZ3VyZTozNjM1OiAkPyA9
IDAKY29uZmlndXJlOjM2NDg6IHJlc3VsdDogbm9uZSBuZWVkZWQKY29uZmlndXJlOjM2NzM6IGNo
ZWNraW5nIHdoZXRoZXIgZ2NjICB1bmRlcnN0YW5kcyAtYyBhbmQgLW8gdG9nZXRoZXIKY29uZmln
dXJlOjM2OTU6IGdjYyAgLWMgY29uZnRlc3QuYyAtbyBjb25mdGVzdDIubwpjb25maWd1cmU6MzY5
ODogJD8gPSAwCmNvbmZpZ3VyZTozNjk1OiBnY2MgIC1jIGNvbmZ0ZXN0LmMgLW8gY29uZnRlc3Qy
Lm8KY29uZmlndXJlOjM2OTg6ICQ/ID0gMApjb25maWd1cmU6MzcxMDogcmVzdWx0OiB5ZXMKY29u
ZmlndXJlOjM3Mzg6IGNoZWNraW5nIGZvciBzdHlsZSBvZiBpbmNsdWRlIHVzZWQgYnkgbWFrZQpj
b25maWd1cmU6Mzc2NjogcmVzdWx0OiBHTlUKY29uZmlndXJlOjM3OTI6IGNoZWNraW5nIGRlcGVu
ZGVuY3kgc3R5bGUgb2YgZ2NjIApjb25maWd1cmU6MzkwMzogcmVzdWx0OiBub25lCmNvbmZpZ3Vy
ZTozOTIwOiBjaGVja2luZyBmb3IgYW4gQU5TSSBDLWNvbmZvcm1pbmcgY29uc3QKY29uZmlndXJl
OjM5ODY6IGdjYyAgLWMgLWlzeXN0ZW0vPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgv
dXNyL2luY2x1ZGUgLU8yIC1waXBlIC1pc3lzdGVtLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0
LWxpbnV4L3Vzci9pbmNsdWRlIGNvbmZ0ZXN0LmMgPiY1CmNvbmZpZ3VyZTozOTg2OiAkPyA9IDAK
Y29uZmlndXJlOjM5OTM6IHJlc3VsdDogeWVzCmNvbmZpZ3VyZTo0MDA0OiBjaGVja2luZyB3aGV0
aGVyIE5MUyBpcyByZXF1ZXN0ZWQKY29uZmlndXJlOjQwMTM6IHJlc3VsdDogbm8KY29uZmlndXJl
OjQwMzE6IGNoZWNraW5nIGZvciBpbnRsdG9vbCA+PSAwLjM1LjAKY29uZmlndXJlOjQwMzM6IHJl
c3VsdDogLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4vbmF0aXZlcGVy
bCBmb3VuZApjb25maWd1cmU6NDAzNjogZXJyb3I6IFlvdXIgaW50bHRvb2wgaXMgdG9vIG9sZC4g
IFlvdSBuZWVkIGludGx0b29sIDAuMzUuMCBvciBsYXRlci4KCiMjIC0tLS0tLS0tLS0tLS0tLS0g
IyMKIyMgQ2FjaGUgdmFyaWFibGVzLiAjIwojIyAtLS0tLS0tLS0tLS0tLS0tICMjCgphY19jdl9j
X2NvbXBpbGVyX2dudT15ZXMKYWNfY3ZfY19jb25zdD15ZXMKYWNfY3ZfZW52X0FMTF9DRkxBR1Nf
c2V0PQphY19jdl9lbnZfQUxMX0NGTEFHU192YWx1ZT0KYWNfY3ZfZW52X0FMTF9MSUJTX3NldD0K
YWNfY3ZfZW52X0FMTF9MSUJTX3ZhbHVlPQphY19jdl9lbnZfQ0Nfc2V0PXNldAphY19jdl9lbnZf
Q0NfdmFsdWU9J2djYyAnCmFjX2N2X2Vudl9DRkxBR1Nfc2V0PXNldAphY19jdl9lbnZfQ0ZMQUdT
X3ZhbHVlPSctaXN5c3RlbS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5j
bHVkZSAtTzIgLXBpcGUnCmFjX2N2X2Vudl9DUFBGTEFHU19zZXQ9c2V0CmFjX2N2X2Vudl9DUFBG
TEFHU192YWx1ZT0taXN5c3RlbS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Iv
aW5jbHVkZQphY19jdl9lbnZfQ1BQX3NldD1zZXQKYWNfY3ZfZW52X0NQUF92YWx1ZT0nZ2NjICAt
RScKYWNfY3ZfZW52X0dJT19DRkxBR1Nfc2V0PQphY19jdl9lbnZfR0lPX0NGTEFHU192YWx1ZT0K
YWNfY3ZfZW52X0dJT19MSUJTX3NldD0KYWNfY3ZfZW52X0dJT19MSUJTX3ZhbHVlPQphY19jdl9l
bnZfTERGTEFHU19zZXQ9c2V0CmFjX2N2X2Vudl9MREZMQUdTX3ZhbHVlPSctTC88c25pcD4vdG1w
L3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliIC1MLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2
XzY0LWxpbnV4L2xpYiAtV2wsLXJwYXRoLWxpbmssLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0
LWxpbnV4L3Vzci9saWIgLVdsLC1ycGF0aC1saW5rLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82
NC1saW51eC9saWIgLVdsLC1ycGF0aCwvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgv
dXNyL2xpYiAtV2wsLXJwYXRoLC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9saWIg
LVdsLC1PMScKYWNfY3ZfZW52X0xJQlNfc2V0PQphY19jdl9lbnZfTElCU192YWx1ZT0KYWNfY3Zf
ZW52X1BLR19DT05GSUdfTElCRElSX3NldD1zZXQKYWNfY3ZfZW52X1BLR19DT05GSUdfTElCRElS
X3ZhbHVlPS88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliL3BrZ2NvbmZp
ZwphY19jdl9lbnZfUEtHX0NPTkZJR19QQVRIX3NldD1zZXQKYWNfY3ZfZW52X1BLR19DT05GSUdf
UEFUSF92YWx1ZT0vPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYi9wa2dj
b25maWc6LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9zaGFyZS9wa2djb25m
aWcKYWNfY3ZfZW52X1BLR19DT05GSUdfc2V0PQphY19jdl9lbnZfUEtHX0NPTkZJR192YWx1ZT0K
YWNfY3ZfZW52X2J1aWxkX2FsaWFzX3NldD1zZXQKYWNfY3ZfZW52X2J1aWxkX2FsaWFzX3ZhbHVl
PXg4Nl82NC1saW51eAphY19jdl9lbnZfaG9zdF9hbGlhc19zZXQ9c2V0CmFjX2N2X2Vudl9ob3N0
X2FsaWFzX3ZhbHVlPXg4Nl82NC1saW51eAphY19jdl9lbnZfdGFyZ2V0X2FsaWFzX3NldD1zZXQK
YWNfY3ZfZW52X3RhcmdldF9hbGlhc192YWx1ZT14ODZfNjQtbGludXgKYWNfY3Zfb2JqZXh0PW8K
YWNfY3ZfcGF0aF9TRUQ9c2VkCmFjX2N2X3BhdGhfaW5zdGFsbD0nL3Vzci9iaW4vaW5zdGFsbCAt
YycKYWNfY3ZfcGF0aF9ta2Rpcj0vYmluL21rZGlyCmFjX2N2X3Byb2dfQVdLPWdhd2sKYWNfY3Zf
cHJvZ19DQz0nZ2NjICcKYWNfY3ZfcHJvZ19jY19jODk9CmFjX2N2X3Byb2dfY2NfZz15ZXMKYWNf
Y3ZfcHJvZ19tYWtlX21ha2Vfc2V0PXllcwphbV9jdl9DQ19kZXBlbmRlbmNpZXNfY29tcGlsZXJf
dHlwZT1ub25lCmFtX2N2X21ha2Vfc3VwcG9ydF9uZXN0ZWRfdmFyaWFibGVzPXllcwphbV9jdl9w
cm9nX2NjX2Nfbz15ZXMKCiMjIC0tLS0tLS0tLS0tLS0tLS0tICMjCiMjIE91dHB1dCB2YXJpYWJs
ZXMuICMjCiMjIC0tLS0tLS0tLS0tLS0tLS0tICMjCgpBQ0xPQ0FMPScke1NIRUxMfSAvPHNuaXA+
L3RtcC93b3JrL3g4Nl82NC1saW51eC9zaGFyZWQtbWltZS1pbmZvLW5hdGl2ZS8xLjItcjAvc2hh
cmVkLW1pbWUtaW5mby0xLjIvbWlzc2luZyBhY2xvY2FsLTEuMTQnCkFMTF9DRkxBR1M9JycKQUxM
X0xJQlM9JycKQUxMX0xJTkdVQVM9JycKQU1ERVBCQUNLU0xBU0g9JycKQU1ERVBfRkFMU0U9JycK
QU1ERVBfVFJVRT0nIycKQU1UQVI9JyQke1RBUi10YXJ9JwpBTV9CQUNLU0xBU0g9J1wnCkFNX0RF
RkFVTFRfVj0nJChBTV9ERUZBVUxUX1ZFUkJPU0lUWSknCkFNX0RFRkFVTFRfVkVSQk9TSVRZPScx
JwpBTV9WPSckKFYpJwpBVVRPQ09ORj0nJHtTSEVMTH0gLzxzbmlwPi90bXAvd29yay94ODZfNjQt
bGludXgvc2hhcmVkLW1pbWUtaW5mby1uYXRpdmUvMS4yLXIwL3NoYXJlZC1taW1lLWluZm8tMS4y
L21pc3NpbmcgYXV0b2NvbmYnCkFVVE9IRUFERVI9JyR7U0hFTEx9IC88c25pcD4vdG1wL3dvcmsv
eDg2XzY0LWxpbnV4L3NoYXJlZC1taW1lLWluZm8tbmF0aXZlLzEuMi1yMC9zaGFyZWQtbWltZS1p
bmZvLTEuMi9taXNzaW5nIGF1dG9oZWFkZXInCkFVVE9NQUtFPScke1NIRUxMfSAvPHNuaXA+L3Rt
cC93b3JrL3g4Nl82NC1saW51eC9zaGFyZWQtbWltZS1pbmZvLW5hdGl2ZS8xLjItcjAvc2hhcmVk
LW1pbWUtaW5mby0xLjIvbWlzc2luZyBhdXRvbWFrZS0xLjE0JwpBV0s9J2dhd2snCkNBVEFMT0dT
PScnCkNBVE9CSkVYVD0nJwpDQz0nZ2NjICcKQ0NERVBNT0RFPSdkZXBtb2RlPW5vbmUnCkNGTEFH
Uz0nLWlzeXN0ZW0vPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUg
LU8yIC1waXBlJwpDUFA9J2djYyAgLUUnCkNQUEZMQUdTPSctaXN5c3RlbS88c25pcD4vdG1wL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZScKQ1JPU1NfQ09NUElMSU5HX0ZBTFNFPScn
CkNST1NTX0NPTVBJTElOR19UUlVFPScnCkNZR1BBVEhfVz0nZWNobycKREFUQURJUk5BTUU9JycK
REVGUz0nJwpERVBESVI9Jy5kZXBzJwpFQ0hPX0M9JycKRUNIT19OPSctbicKRUNIT19UPScnCkVH
UkVQPScnCkVOQUJMRV9ERUZBVUxUX01BS0VfQ0hFQ0tfRkFMU0U9JycKRU5BQkxFX0RFRkFVTFRf
TUFLRV9DSEVDS19UUlVFPScnCkVOQUJMRV9VUERBVEVfTUlNRURCX0ZBTFNFPScnCkVOQUJMRV9V
UERBVEVfTUlNRURCX1RSVUU9JycKRVhFRVhUPScnCkdFVFRFWFRfUEFDS0FHRT0nJwpHSU9fQ0ZM
QUdTPScnCkdJT19MSUJTPScnCkdNT0ZJTEVTPScnCkdNU0dGTVQ9JycKR1JFUD0nJwpIQVZFX0dJ
T19GQUxTRT0nJwpIQVZFX0dJT19UUlVFPScnCklOU1RBTExfREFUQT0nJHtJTlNUQUxMfSAtbSA2
NDQnCklOU1RBTExfUFJPR1JBTT0nJHtJTlNUQUxMfScKSU5TVEFMTF9TQ1JJUFQ9JyR7SU5TVEFM
TH0nCklOU1RBTExfU1RSSVBfUFJPR1JBTT0nJChpbnN0YWxsX3NoKSAtYyAtcycKSU5TVE9CSkVY
VD0nJwpJTlRMTElCUz0nJwpJTlRMVE9PTF9DQVZFU19SVUxFPScnCklOVExUT09MX0RFU0tUT1Bf
UlVMRT0nJwpJTlRMVE9PTF9ESVJFQ1RPUllfUlVMRT0nJwpJTlRMVE9PTF9FWFRSQUNUPScnCklO
VExUT09MX0tCRF9SVUxFPScnCklOVExUT09MX0tFWVNfUlVMRT0nJwpJTlRMVE9PTF9NRVJHRT0n
JwpJTlRMVE9PTF9PQUZfUlVMRT0nJwpJTlRMVE9PTF9QRVJMPScnCklOVExUT09MX1BPTElDWV9S
VUxFPScnCklOVExUT09MX1BPTkdfUlVMRT0nJwpJTlRMVE9PTF9QUk9QX1JVTEU9JycKSU5UTFRP
T0xfU0NIRU1BU19SVUxFPScnCklOVExUT09MX1NFUlZFUl9SVUxFPScnCklOVExUT09MX1NFUlZJ
Q0VfUlVMRT0nJwpJTlRMVE9PTF9TSEVFVF9SVUxFPScnCklOVExUT09MX1NPVU5ETElTVF9SVUxF
PScnCklOVExUT09MX1RIRU1FX1JVTEU9JycKSU5UTFRPT0xfVUlfUlVMRT0nJwpJTlRMVE9PTF9V
UERBVEU9JycKSU5UTFRPT0xfVl9NRVJHRT0nJwpJTlRMVE9PTF9WX01FUkdFX09QVElPTlM9JycK
SU5UTFRPT0xfWEFNX1JVTEU9JycKSU5UTFRPT0xfWE1MX05PTUVSR0VfUlVMRT0nJwpJTlRMVE9P
TF9YTUxfUlVMRT0nJwpJTlRMVE9PTF9fdl9NRVJHRV8wPScnCklOVExUT09MX192X01FUkdFXz0n
JwpMREZMQUdTPSctTC88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliIC1M
LzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xpYiAtV2wsLXJwYXRoLWxpbmssLzxz
bmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9saWIgLVdsLC1ycGF0aC1saW5rLC88
c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9saWIgLVdsLC1ycGF0aCwvPHNuaXA+L3Rt
cC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYiAtV2wsLXJwYXRoLC88c25pcD4vdG1wL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC9saWIgLVdsLC1PMScKTElCT0JKUz0nJwpMSUJTPScnCkxUTElC
T0JKUz0nJwpNQUtFSU5GTz0nJHtTSEVMTH0gLzxzbmlwPi90bXAvd29yay94ODZfNjQtbGludXgv
c2hhcmVkLW1pbWUtaW5mby1uYXRpdmUvMS4yLXIwL3NoYXJlZC1taW1lLWluZm8tMS4yL21pc3Np
bmcgbWFrZWluZm8nCk1LRElSX1A9Jy9iaW4vbWtkaXIgLXAnCk1LSU5TVEFMTERJUlM9JycKTVNH
Rk1UPScnCk1TR0ZNVF9PUFRTPScnCk1TR01FUkdFPScnCk9CSkVYVD0nbycKUEFDS0FHRT0nc2hh
cmVkLW1pbWUtaW5mbycKUEFDS0FHRV9CVUdSRVBPUlQ9J2h0dHBzOi8vYnVncy5mcmVlZGVza3Rv
cC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PXNoYXJlZC1taW1lLWluZm8nClBBQ0tBR0VfTkFN
RT0nc2hhcmVkLW1pbWUtaW5mbycKUEFDS0FHRV9TVFJJTkc9J3NoYXJlZC1taW1lLWluZm8gMS4y
JwpQQUNLQUdFX1RBUk5BTUU9J3NoYXJlZC1taW1lLWluZm8nClBBQ0tBR0VfVVJMPScnClBBQ0tB
R0VfVkVSU0lPTj0nMS4yJwpQQVRIX1NFUEFSQVRPUj0nOicKUEtHX0NPTkZJRz0nJwpQS0dfQ09O
RklHX0xJQkRJUj0nLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9saWIvcGtn
Y29uZmlnJwpQS0dfQ09ORklHX1BBVEg9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51
eC91c3IvbGliL3BrZ2NvbmZpZzovPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNy
L3NoYXJlL3BrZ2NvbmZpZycKUE9GSUxFUz0nJwpQT1NVQj0nJwpQT19JTl9EQVRBRElSX0ZBTFNF
PScnClBPX0lOX0RBVEFESVJfVFJVRT0nJwpTRVRfTUFLRT0nJwpTSEVMTD0nL2Jpbi9iYXNoJwpT
VFJJUD0nc3RyaXAnClVQREFURV9NSU1FX0RBVEFCQVNFPScnClVTRV9OTFM9J25vJwpWRVJTSU9O
PScxLjInClhHRVRURVhUPScnClhNTExJTlQ9JycKYWNfY3RfQ0M9JycKYW1fX0VYRUVYVF9GQUxT
RT0nJwphbV9fRVhFRVhUX1RSVUU9JycKYW1fX2Zhc3RkZXBDQ19GQUxTRT0nJwphbV9fZmFzdGRl
cENDX1RSVUU9JyMnCmFtX19pbmNsdWRlPSdpbmNsdWRlJwphbV9faXNyYz0nIC1JJChzcmNkaXIp
JwphbV9fbGVhZGluZ19kb3Q9Jy4nCmFtX19ub2RlcD0nJwphbV9fcXVvdGU9JycKYW1fX3Rhcj0n
JCR7VEFSLXRhcn0gY2hvZiAtICIkJHRhcmRpciInCmFtX191bnRhcj0nJCR7VEFSLXRhcn0geGYg
LScKYmluZGlyPScvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2JpbicKYnVp
bGRfYWxpYXM9J3g4Nl82NC1saW51eCcKZGF0YWRpcj0nLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2
XzY0LWxpbnV4L3Vzci9zaGFyZScKZGF0YXJvb3RkaXI9JyR7cHJlZml4fS9zaGFyZScKZG9jZGly
PScke2RhdGFyb290ZGlyfS9kb2MvJHtQQUNLQUdFX1RBUk5BTUV9JwpkdmlkaXI9JyR7ZG9jZGly
fScKZXhlY19wcmVmaXg9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3InCmhv
c3RfYWxpYXM9J3g4Nl82NC1saW51eCcKaHRtbGRpcj0nJHtkb2NkaXJ9JwppbmNsdWRlZGlyPScv
PHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUnCmluZm9kaXI9Jy88
c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvaW5mbycKaW5zdGFsbF9z
aD0nJHtTSEVMTH0gLzxzbmlwPi90bXAvd29yay94ODZfNjQtbGludXgvc2hhcmVkLW1pbWUtaW5m
by1uYXRpdmUvMS4yLXIwL3NoYXJlZC1taW1lLWluZm8tMS4yL2luc3RhbGwtc2gnCmludGx0b29s
X192X21lcmdlX29wdGlvbnNfMD0nJwppbnRsdG9vbF9fdl9tZXJnZV9vcHRpb25zXz0nJwpsaWJk
aXI9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliJwpsaWJleGVjZGly
PScvPHNuaXA+L3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYi9zaGFyZWQtbWltZS1p
bmZvJwpsb2NhbGVkaXI9JyR7ZGF0YXJvb3RkaXJ9L2xvY2FsZScKbG9jYWxzdGF0ZWRpcj0nLzxz
bmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3ZhcicKbWFuZGlyPScvPHNuaXA+L3RtcC9z
eXNyb290cy94ODZfNjQtbGludXgvdXNyL3NoYXJlL21hbicKbWtkaXJfcD0nJChNS0RJUl9QKScK
b2xkaW5jbHVkZWRpcj0nLzxzbmlwPi90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9pbmNs
dWRlJwpwZGZkaXI9JyR7ZG9jZGlyfScKcHJlZml4PScvPHNuaXA+L3RtcC9zeXNyb290cy94ODZf
NjQtbGludXgvdXNyJwpwcm9ncmFtX3RyYW5zZm9ybV9uYW1lPSdzLHgseCwnCnBzZGlyPScke2Rv
Y2Rpcn0nCnNiaW5kaXI9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3Ivc2Jp
bicKc2hhcmVkc3RhdGVkaXI9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9jb20n
CnN5c2NvbmZkaXI9Jy88c25pcD4vdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC9ldGMnCnRhcmdl
dF9hbGlhcz0neDg2XzY0LWxpbnV4JwoKIyMgLS0tLS0tLS0tLS0gIyMKIyMgY29uZmRlZnMuaC4g
IyMKIyMgLS0tLS0tLS0tLS0gIyMKCi8qIGNvbmZkZWZzLmggKi8KI2RlZmluZSBQQUNLQUdFX05B
TUUgInNoYXJlZC1taW1lLWluZm8iCiNkZWZpbmUgUEFDS0FHRV9UQVJOQU1FICJzaGFyZWQtbWlt
ZS1pbmZvIgojZGVmaW5lIFBBQ0tBR0VfVkVSU0lPTiAiMS4yIgojZGVmaW5lIFBBQ0tBR0VfU1RS
SU5HICJzaGFyZWQtbWltZS1pbmZvIDEuMiIKI2RlZmluZSBQQUNLQUdFX0JVR1JFUE9SVCAiaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9c2hhcmVkLW1p
bWUtaW5mbyIKI2RlZmluZSBQQUNLQUdFX1VSTCAiIgojZGVmaW5lIFBBQ0tBR0UgInNoYXJlZC1t
aW1lLWluZm8iCiNkZWZpbmUgVkVSU0lPTiAiMS4yIgoKY29uZmlndXJlOiBleGl0IDEK

--001a11c13d5c4a519d04fa8d311a--
