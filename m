Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh1KI-0003vT-PY
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:30:47 +0200
Received: by eekd49 with SMTP id d49so2133408eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=yVfrPtHMgGYWIYNyTWwLx1lOymw9GzbRywPP6yHwEho=;
	b=gn0WvZFeBcgdO1TgHVODwYJYx3kncDFNAuiV6Fo3BoGTNWIo4ubV1Dfm2c+QnVwQPG
	ZvW+YZK7ChUk4thvneuzTj8J2JKTPI1eutWm3hnTBsASTxJyvghu/H0EXhmMvBNhRFWH
	/pe0rliR7lp8pIzFkS2jC54YKOhB/8oiz6sk/XjZWnCwo+TKf5Ud3jUsBnHIGz2kljNE
	Rl1A9i+Al1AS/u5Vr9Dbcqn0iT+0Db7NXOCCyPHZSgNgyNgI3M5AjdeWFhr7oL0r2CRg
	/T4wd/T0UCRBjeUgJnkykbr6jRWi67yYm73E9FtiZr9LmP7iS5b9HP/SCUm6qitRgySl
	ze1w==
Received: by 10.14.97.16 with SMTP id s16mr4160618eef.117.1340122803127; Tue,
	19 Jun 2012 09:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 09:19:32 -0700 (PDT)
In-Reply-To: <4FE0714A.1060603@linaro.org>
References: <4FE0684D.2000906@linaro.org> <4FE0714A.1060603@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2012 09:19:32 -0700
Message-ID: <CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Is target toolchain supposed to be working?
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
X-List-Received-Date: Tue, 19 Jun 2012 16:30:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 5:32 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 19.06.2012 13:53, Marcin Juszkiewicz pisze:
>> ignoring nonexistent directory "usr/include/c++/"
>> ignoring nonexistent directory "usr/include/c++//i586-oe-linux"
>> ignoring nonexistent directory "usr/include/c++//backward"
>> ignoring nonexistent directory "/usr/local/include"
>> ignoring nonexistent directory
>> "/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
>> #include "..." search starts here:
>> =C2=A0.
>> #include <...> search starts here:
>> =C2=A0..
>> =C2=A0../lib
>> =C2=A0/usr/lib/gcc/i586-oe-linux/4.7.1/include
>> =C2=A0/usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
>> =C2=A0/usr/include
>> =C2=A0../lib/compat
>> End of search list.
>
> Attached patch fixed problem for me.
>


includedir already has leading slash so I wonder if you changed
includedir in your setup somehow ?

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


