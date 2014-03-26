Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC5A60C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:38:27 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so806895ykp.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fcG8mpphS1ZqgJHHtSeRA0rzENoKonWtOPyhoRi3ssI=;
	b=CuERpaD6WwqlG8aRHdhmp/2RpKifv0dlNOJ0z4BHbK4pzGrExmhiUbi6rVvdAOQD7F
	7UyPCrWBvjXTWsIeGPNB65KBnHzHPFLyo8zsHl85sK7O/Yrl7H5fGlRR7Ba9o0Ju7POV
	jaHCJtu9bmB5NgwZjLS5jZamsNZEr+opRJwu81p9WM1LdGLUKE17a1Tx0Fm6PHunw8g7
	aBhB7J/cqyetUkOg3YkYjvdoBbPw3eJpsBAYjJCx94KLAms22YQ6/8imBc5J5+PhPlRU
	vWQpnKoTjcIGjVHmtbEhriyapSnhQN5crt4iqqJYsE7GBfzSC5N8CYp0yhR7DAcGKwJb
	mCNw==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr50634118yhq.14.1395844708424;
	Wed, 26 Mar 2014 07:38:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 07:38:28 -0700 (PDT)
In-Reply-To: <5332E520.5050005@linaro.org>
References: <1395676843.24890.7.camel@ted> <5330C9A8.904@linaro.org>
	<20140325055028.GA3710@jama> <5332E520.5050005@linaro.org>
Date: Wed, 26 Mar 2014 11:38:28 -0300
X-Google-Sender-Auth: wMZse3x5f2rFkcY-bBAUdDvHK44
Message-ID: <CAP9ODKoSO6ewoim_4c6N15C5-uQz0XQ3kPam421mYRPhRcWoNg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Wed, 26 Mar 2014 14:38:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 26, 2014 at 11:33 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> On 03/25/14 01:50, Martin Jansa wrote:
>> Can you show some example of config you need to have wor wayland and
>> cannot have for core-image-minimal?
>
...
> As a concrete example, currently I'm flipping between dora and master
> builds. For some reason I can't seem to reuse the same TMPDIR between
> them. So every time I "repo init -b <newbranch>" I then also have to
> edit conf/local.conf before bitbaking.

Use separated build directories for this, so you don't need to mangle
conf/local.conf every time.

Personally I have different trees for Dora and Master and inside it I
have several build directories when working in this kind of test
(different distro features and like) and this is easy to maintain. For
auto builder, we cooked a script to abstract the configuration in
command line options so we can easily extend it and get it used in
several build jobs.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

