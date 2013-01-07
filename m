Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsACj-0003ts-Ea
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 11:45:18 +0100
Received: by mail-oa0-f41.google.com with SMTP id k14so17779518oag.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=o4VGXR5X++n6Lc4UThtPsx5cDYFTYGyt6FUwPOSmE74=;
	b=aBVDRsPQIniQEDxv4S9uPpPXAogcCLnugUNWpez5Q+Q3Nz7v7hgrVImx39JXW2GLbQ
	4gcE7W2/J0uNV6JAzN5kCZmfHRIH2VeoYkfeJeOUZyLPocYU/Ht4HGKPSWYl9/XJd9Mz
	jgbuBFweUVc2+YnFEmn2wELbHihGpcVsZRARZl0j5sBXpIW205bfgR4TpAqmbowmoofC
	4SDY1afBTMC5Sb0ux8AQggxLE7LRxFElGNlbTBmMLEAqRa/UoTthhqTwrm6ZivVgCpv4
	Tt7gVUqZ25zDAF5KMdHzJF3f5XWyOc++rhl49buZJXl0LlKSEIYujlvTB/lWSKnLy2w9
	1RrQ==
MIME-Version: 1.0
Received: by 10.182.131.3 with SMTP id oi3mr39130527obb.13.1357554607797; Mon,
	07 Jan 2013 02:30:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 02:30:07 -0800 (PST)
In-Reply-To: <50EA3BB5.7080103@windriver.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
	<CAP9ODKpQUQmBOnWHRBEcF6k3aK=-bqM0=9m+bi8DxXC7gsHzSw@mail.gmail.com>
	<50EA3BB5.7080103@windriver.com>
Date: Mon, 7 Jan 2013 08:30:07 -0200
X-Google-Sender-Auth: wSWixPTAd9E42U0YQ8Y7vVCb_YM
Message-ID: <CAP9ODKqdZVqPj8zMvmDnCbyJZSN_MB2f+qutTKBwkn4FE3aNLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6 6/6] core-image-sato: support read-only rootfs
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
X-List-Received-Date: Mon, 07 Jan 2013 10:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 1:06 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 01/07/2013 03:05 AM, Otavio Salvador wrote:
>>
>> On Sun, Jan 6, 2013 at 7:44 AM,  <Qi.Chen@windriver.com> wrote:
>>>
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Support read-only rootfs by providing a specific conf file for volatile
>>> storage.
>>>
>>> [YOCTO #3406]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
>> I prefer this solution than the previous one however why you don't use
>> a sato-volatile-conf package to provide this?
>
> Because the there exists a one-to-one (or almost one-to-one) correspondence
> between the volatile conf file and the specific image.
>
> If there is a 'sato-volatile-conf' package, then there should be a
> 'minimal-volatile-conf', and maybe a 'custom-volatile-conf' if users are
> using a customized image.
>
> So I think it's simpler to let the image recipe provide the conf file.
> The only thing we have to do, when adding read-only rootfs support to some
> image, is to add the conf file to SRC_URI and install it in
> choose_volatile_conf.

The problem of not using a package for it is regarding upgrades; it is
not possible to upgrade the configuration file using the package
manager. I know most systems using the read-only-fs will be small and
do not use a package manager at all but some use cases will do (mine,
in case).

So I do believe we ought to have a one-to-one correspondence here.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


