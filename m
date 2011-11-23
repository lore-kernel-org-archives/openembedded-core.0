Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTAKU-0000h0-BQ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 11:45:26 +0100
Received: by bkbzs2 with SMTP id zs2so1369136bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=uv5/KecX502tXADetOO4hbXz8RE3eiZVbV1D0UgGTdg=;
	b=S683gP11QGGZKNgxyV2GcmgIESRnFbARhPNU97uPegQbP7MP/nasX0xMwfbVv4qmpD
	xiQ7ay2tPXSRYHjRXCQDmbcaZ2VL82ahG1fLD9PRF2FyyMr5nVo6ciOmU3ghqv3XmwfH
	DQgOeKdtd5OftwteZ4GQZ+dYs46K8OayYVSzY=
MIME-Version: 1.0
Received: by 10.204.148.4 with SMTP id n4mr23632728bkv.42.1322044734652; Wed,
	23 Nov 2011 02:38:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Wed, 23 Nov 2011 02:38:54 -0800 (PST)
In-Reply-To: <4ECC07D8.2070104@linux.intel.com>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
Date: Wed, 23 Nov 2011 08:38:54 -0200
X-Google-Sender-Auth: RFK2lBIw7ZmBy5NEAz8CnuGed5M
Message-ID: <CAP9ODKpCvkQEE8qgCLP=T2g7ZD2MG2jEfs=pNnr7DqyJ772EAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Wed, 23 Nov 2011 10:45:27 -0000
Content-Type: multipart/alternative; boundary=0015174bf02cc9405e04b264868e

--0015174bf02cc9405e04b264868e
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 22, 2011 at 18:36, Saul Wold <sgw@linux.intel.com> wrote:

> On 11/22/2011 06:34 AM, Anders Darander wrote:
>
>> This updates busybox to the latest stable, 1.19.3.
>>
>> Among other things, there should be rudimentary support in syslogd for
>> systemd, by enabling CONFIG_FEATURE_SYSTEMD.
>>
>>  How much size does this add to busybox by having it enabled by default?
> Is it possible to conditional add a config fragment if systemd is enabled
> ad the DISTRO/IMAGE_FEATURE level?
>

If it is small it would be nice to have it enabled.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174bf02cc9405e04b264868e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 22, 2011 at 18:36, Saul Wold <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On 11/22/2011 06:34 AM, Anders Darander wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This updates busybox to the latest stable, 1.19.3.<br>
<br>
Among other things, there should be rudimentary support in syslogd for<br>
systemd, by enabling CONFIG_FEATURE_SYSTEMD.<br>
<br>
</blockquote></div>
How much size does this add to busybox by having it enabled by default?<br>
Is it possible to conditional add a config fragment if systemd is enabled a=
d the DISTRO/IMAGE_FEATURE level?<br></blockquote><div><br></div><div>If it=
 is small it would be nice to have it enabled.</div><div><br></div></div>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015174bf02cc9405e04b264868e--
