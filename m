Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNMco-0004tr-Kq
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 14:17:10 +0200
Received: by mail-oa0-f47.google.com with SMTP id o17so1378151oag.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YkHDXFiqzDX7AaNYXPJ8kB2JUFDVCnubuKNCJ077OvY=;
	b=br8dVx7QALXMsqCyyr4gLC3TczHrEsneMtHOLMxvhu6pwlWTHCj5TdbQ/HIqHDk1zY
	fzmAdShnBRBmDh1rpPc9z6qZjaxLdbNLY08/DJ+B6myvl+vs3mEx6pHuDqIUwyDysuI7
	OQLKGTrDiZGPzwtidEtpisQ3YPjLMPGonujlcLhFo0gi4nEA9qk5MYZeqqWCrZlzovb0
	tuwMJQDFf73cqvLbCztK8MwRRAXSwxz5G/bHy2xkHYt8UjLoHtMf73qvWhzHoEZiIJRt
	5RQru5KicwqKiNZzcGLJ0kaVKJeGxnHG6VWFTNxwlnhmm9O/w4apjP2OTDe5pzbW0Ja/
	i6+Q==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr863078obk.72.1364990399006; Wed,
	03 Apr 2013 04:59:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 3 Apr 2013 04:59:58 -0700 (PDT)
In-Reply-To: <CAJTo0Lbe4zUsJk5rjoDJYqz3GLGPSA_mhRad5kSPw5qDEnL2gw@mail.gmail.com>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
	<CAJTo0Lbe4zUsJk5rjoDJYqz3GLGPSA_mhRad5kSPw5qDEnL2gw@mail.gmail.com>
Date: Wed, 3 Apr 2013 08:59:58 -0300
X-Google-Sender-Auth: EumTGDjP8ptqgnucnurmdhC0HNk
Message-ID: <CAP9ODKoPUnH7hhuMJWY4txiw3CHLQxgNqknGJYJE=LjCVXksHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Wed, 03 Apr 2013 12:17:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 3, 2013 at 7:38 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 2 April 2013 03:30,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Sato images, by default, have about 100M free space. This is not enough
>> and it blocks automatic testing.
>>
>> This patch fixes this problem by overriding the IMAGE_OVERHEAD_FACTOR
>> in the sato image recipe.
>
> If a particular build needs more disk space, you can also use
> IMAGE_ROOTFS_EXTRA_SPACE in local.conf, i.e.:
>
> IMAGE_ROOTFS_EXTRA_SPACE = "524288"
>
> (that's add 500MB)

I think Chen wants a more permanent solution so automatic testing can
work out of box. Maybe a fixed extra size would be better for this
case but needs to be done in the image in either case.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


