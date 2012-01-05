Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Riihe-00052J-1q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 09:29:38 +0100
Received: by pbcc11 with SMTP id c11so148387pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 00:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ebEVI09BjwF1GSPg0eJkMs2XSzojrwfZ4NtEbAQwC0Q=;
	b=uYb4fUjrc09rTe7eE0MCsHKNctMCYBnO3/9gVBqq8odoH3fpXZafgxT449/zz4tcW3
	vg1VbgWvPuM/f6Y/ea/3xWARXL0ln1O3FJGWXZYwab9LbRYHxLkniDhGzOKsJ8aNzgXH
	0W6lk25OyXd67ALxpq1JjRag6OOou8SQQ0Qak=
MIME-Version: 1.0
Received: by 10.68.201.136 with SMTP id ka8mr3043949pbc.1.1325751734649; Thu,
	05 Jan 2012 00:22:14 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Thu, 5 Jan 2012 00:22:14 -0800 (PST)
In-Reply-To: <CAAQYJAtDd7SefbyUGJTwbvPErrZ3t8n=Jvf=vN1FW4_CO5eSkw@mail.gmail.com>
References: <CAAQYJAtDd7SefbyUGJTwbvPErrZ3t8n=Jvf=vN1FW4_CO5eSkw@mail.gmail.com>
Date: Thu, 5 Jan 2012 09:22:14 +0100
Message-ID: <CAAQYJAvKF8fGu0cXkPLehpHV9XgYqS4ajpsMQsd3k7Mq5Z3Cfg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: rootfs_ipk.bbclass: : [: -eq: unary operator expected
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
X-List-Received-Date: Thu, 05 Jan 2012 08:29:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 12:56 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Checking the logs I noticed this note:
>
> /oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/initramfs-kexec=
boot-klibc-image-1.0-r0/temp/run.do_rootfs.22017:
> line 271: [: -eq: unary operator expected
>
> The line in question is in rootfs_ipk.bbclass
>
> rootfs_ipk_do_rootfs()
> ...
>
> =A0if [ $runtime_script_required -eq 0 ]; then
>
>
> IMHO the test should be refined.
>
> Regards
>
> Andrea

I think it comes from the recent commit
"2feba313c991170747381c7cf821a45c2cd04632 opkg: Update svn 625 -> 633
and fix preinst issues"


Regards

Andrea


