Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TA1dC-00039E-5t
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 18:42:10 +0200
Received: by eekb57 with SMTP id b57so1190237eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zb3QYKV/w5yKkmsipDbkq40k8qfek1EMl4fY9Yt1dl0=;
	b=bvhuMn/QMsbjIXakFC2OALzXvmVqv6ifUNHWSjQcARITlplpnBijOaSeCwy1xSHelh
	rjhL8qv3q4FX1jVkF6A4ZOpzbQ8E/S16/jcSq4zKDpmbgmuFa4tgyrVqCl3fSTY+0oVd
	ywKXi2HiyEOIBUh5M2uOQOiQE12eCZsf32uBbuep/J9YMhJdyF4IKlzD69kAiIlNRV4B
	tEox/DKWw8VlS8a4QuoKxEKJaxvXzR3L70k4F6WCfWl6ntutlmZyF8eFIw+iw8sM5kFl
	W5n0+LfORmf8P2FlgA3iJKwbxdZKrUtfWPhDaDlk0GDErPztmLQHSxS+Q+/34STaRhMb
	XmOg==
Received: by 10.14.218.134 with SMTP id k6mr9056053eep.14.1347035384394; Fri,
	07 Sep 2012 09:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 09:29:14 -0700 (PDT)
In-Reply-To: <CAOHjBZsUj7ObbzVQUTKeV6kf29YP3_o0Pnm_tJujfXhpGSD9MA@mail.gmail.com>
References: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
	<CAOHjBZvb3Zne1eQbw=2J4fVXdQH3QpynzrXsnE17gRNxowFi0A@mail.gmail.com>
	<CAMKF1sqCgp-yH7hP-izT=L0qiWfuGpkiCSbuJQ0OtGZ1TgfGgQ@mail.gmail.com>
	<CAOHjBZvkfpvmwFn+VpMyJrb2tfZ5j45OqXgRyzVJh6Ozj-HnDg@mail.gmail.com>
	<CAOHjBZvo0yyLXfxUGgEq1cBiTn0--wYj+Jvv_2NYAwAF0VjaqQ@mail.gmail.com>
	<CAOHjBZsUj7ObbzVQUTKeV6kf29YP3_o0Pnm_tJujfXhpGSD9MA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 09:29:14 -0700
Message-ID: <CAMKF1soz+96VdGKy07oLTF-=f7O=CWcSr0vqCECCScWj2+4eGA@mail.gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot find -lssp during uclibc package build
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
X-List-Received-Date: Fri, 07 Sep 2012 16:42:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 7, 2012 at 1:46 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Update: removing ssp from DISTRO_FEATURES solve to build error but
> (obviously) remove ssp support
> from uclibc package.
> Is there a way to avoid this?

I think uclibc should not need this option to build itself to be ssp capable.


