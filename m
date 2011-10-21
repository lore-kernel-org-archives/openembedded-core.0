Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHDwo-0008RY-8Q
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 14:11:38 +0200
Received: by bkat8 with SMTP id t8so5028338bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PHZrfs/vu17abFJ+UiL7eSbE5wWpli5ik8L6swo9tXU=;
	b=Fbe5IscAoDTdkNCAPjNd2llglafMCDgfgS8vnzVgXWubFkMHUFjbhXjOsiE63lXCMW
	0+HSdnEbWBtrC7QwP2BVWZ7uOh8NKaw4LpuWw1oufeI+/wq853vU4qJmjsrbUhEVzeL0
	HIUcNo5MroO5dz9gUP4/XLZ8NTjXrI5Umkiig=
MIME-Version: 1.0
Received: by 10.204.156.1 with SMTP id u1mr10623453bkw.18.1319198741861; Fri,
	21 Oct 2011 05:05:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 05:05:41 -0700 (PDT)
In-Reply-To: <1319179949.3244.0.camel@lenovo.internal.reciva.com>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
	<1319179949.3244.0.camel@lenovo.internal.reciva.com>
Date: Fri, 21 Oct 2011 10:05:41 -0200
X-Google-Sender-Auth: TUnu3IPIpbvt2CJR-RACSdEWrRs
Message-ID: <CAP9ODKoJPK_v4OAO8aPiOg_NB7LHu_RXcyVKanfjHcGyFHFdYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 12:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 04:52, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-10-21 at 03:31 +0000, Otavio Salvador wrote:
>> @@ -37,7 +37,7 @@ do_install () {
>> =A0 =A0 =A0 install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
>> =A0}
>>
>> -pkg_postinst_${PN} () {
>> +pkg_preinst_${PN} () {
>> =A0 =A0 =A0 set -e
>>
>> =A0 =A0 =A0 if [ ! -e $D${sysconfdir}/passwd ] ; then
>
> Doesn't this break on-target installs (or, more generally, installs
> where preinst runs before unpacking)?

It does indeed. I will fix it and send a new patch for it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


