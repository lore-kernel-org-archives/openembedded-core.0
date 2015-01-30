Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 117FF60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0U95aa5027822; Fri, 30 Jan 2015 09:05:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id daAqJu2P8iQd; Fri, 30 Jan 2015 09:05:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0U95KXM027803
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Jan 2015 09:05:34 GMT
Message-ID: <1422608720.5312.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 30 Jan 2015 09:05:20 +0000
In-Reply-To: <CAP71WjwCEkOzO0Xdz0emhSk0j3Fi3o9SH-AbEuP=Jawp7ioQig@mail.gmail.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
	<CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
	<54CAE393.2020605@windriver.com>
	<CAP71Wjxk0XFr5L6YL55GBUeGkx0q+dyh1fw245qi7O7j7gJE9w@mail.gmail.com>
	<54CB3932.2090308@windriver.com>
	<CAP71WjwCEkOzO0Xdz0emhSk0j3Fi3o9SH-AbEuP=Jawp7ioQig@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Fri, 30 Jan 2015 09:05:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-01-30 at 09:02 +0100, Nicolas Dechesne wrote:
> On Fri, Jan 30, 2015 at 8:56 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
> > Understood, but there are 2 version mesa_xxx.bb and mesa_git.bb.
> > Is there any reason why keep two versions?
> 
> right. this is indeed a good question. I am not sure what the
> 'semantics' of the _git.bb recipe really is. In my minds the _git was
> supposed to point to development branch, or -rc release... looking at
> history it seems we keep it in sync with the other mesa recipe.. so i
> am not actually sure why we do that.. maybe someone else can answer.

There once was a plan to have something closer to upstream for testing
and getting things from the SCM is the way to do that. The indent was to
learn about issues before they got released rather than afterwards.

As such, we have pieces of this around, the poky-bleeding DISTRO setting
for example was meant to enable the git versions of recipes.

Some people when developing/testing/debugging have developed git
versions of recipes and where they still work and aren't a maintenance
burden, we've left them. I've personally used a few recipes like that
and I know others have too.

I do still dream of the day we'll have the resources/technology to make
poky-bleeding a reality again.

So the git recipe is intended to look beyond the last stable release or
otherwise be the same.

Cheers,

Richard


