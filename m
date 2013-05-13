Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ubv5M-00056t-Uo
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:54:49 +0200
Received: by mail-ob0-f175.google.com with SMTP id wd6so2167044obb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=07uGCX/2VUHKOiChx/q/EuWKEcJHMyPmPhbUw+5VNZ4=;
	b=SQ3h2bZOjyhGx8ECV8HYHi4idAD50rMwV8GvFCbBs2reu9r3LJ9BbSb511yKaeGyaV
	G5yonkzq749bfYfMd79M80eQGZ2BG7u9Wqzw8xtn36wngzikhJIW6zYEmXwUK/t0GaA7
	PK0OWAz1v+TKMDLatuZdjiu00uTuucXNlX5V54LdGqPZp5a9ZA4OyPTPBPqXjPo4tg4e
	h2k1LgE8ulkC58i5XR9NFZN24rDnEUTuJ1YuXL5oe7UkJ1Jbh0kSCc0gUWebMNiF7aft
	YNUL03FAgxDQ2dMnYJviPbVkTUlmju0uAhth9VTHRfC3lJJ8GIOk5KmyghGyGFzdWdcU
	qHoQ==
MIME-Version: 1.0
X-Received: by 10.182.56.169 with SMTP id b9mr10733388obq.42.1368459398362;
	Mon, 13 May 2013 08:36:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 13 May 2013 08:36:38 -0700 (PDT)
In-Reply-To: <CAJTo0La+3k4HPZzXuV8gqKUSGhk3+=jHXnpa516Ge7KSAi9waA@mail.gmail.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
	<517B30A4.5050405@windriver.com>
	<CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
	<CAP9ODKrOs_bqf0g5Aw3WhJ3ZVoNM2aqMCoQzWZ+8e9LX7cwscg@mail.gmail.com>
	<CAJTo0La+3k4HPZzXuV8gqKUSGhk3+=jHXnpa516Ge7KSAi9waA@mail.gmail.com>
Date: Mon, 13 May 2013 12:36:38 -0300
X-Google-Sender-Auth: YMpsZXkUwzy_7cx6sUpQ6I64Qi0
Message-ID: <CAP9ODKqrVvytteu9G2kb5=9Xh1EjhMA2Sh9BokJUMb5_So-Row@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Mon, 13 May 2013 15:55:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 12:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 May 2013 16:23, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> We may need to have a mechanism to specific build dependencies for
>> native depending on host version/distribution.
>
> The situation is that Suse splits the expat parser into a separate
> package for some reason, so the "fix" is to actually install the whole
> Python core library by installing python-xml if it isn't already
> pulled in.  We could add a sanity test that the python available is a
> full python and not missing the expat parser (suse without python-xml)
> or isn't python-minimal (ubuntu).

Yes; this might be a solution.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


