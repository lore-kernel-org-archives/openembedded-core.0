Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6Sdt-0001Zh-PF
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 22:44:09 +0200
Received: by eekb57 with SMTP id b57so1726298eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KXKwp809zdLsOnjjUrJyRFJ3iOfg81qJbEIbZ4ufREA=;
	b=qdgsWQwD9w2aCi0801mFIVR0wKN/WqG4G7MYxFOJXdBVr/kaF8l+QQgLMVfnZiWfUS
	ce5BRUN0nHBqiPIi+1vU4dqVuzqa261TP+Edcp2CqKp98DfUkQ+ZYdT+EquQrXa6uX4Q
	DvnM5aAYsT2zXnAAni5RK4k51BH1HcmWPIX1IoNQx6Hbo/XuJoS72ZQioT34/GxsDvdq
	TNoZbFRZ/mMtHYdHUJloo2rlZI+7SHkvnj6Dfegj51Obcw9cL/JuZKN3umcis8/KGPKt
	YZmoBvlpFnSK3+UiTg9VAKdSiQoeoXh+a6dOK851WgsiXi3K8Kz/vD4FAor0JtlKKEPS
	zROQ==
Received: by 10.14.218.134 with SMTP id k6mr23830195eep.14.1346185916703; Tue,
	28 Aug 2012 13:31:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 28 Aug 2012 13:31:26 -0700 (PDT)
In-Reply-To: <CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<1485327.Nf27BjiNnc@helios>
	<CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2012 13:31:26 -0700
Message-ID: <CAMKF1sp5PQiCyMRUD8_PG_cA8Ougu2jOmUwW9Hg2Hpv+2HChxw@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
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
X-List-Received-Date: Tue, 28 Aug 2012 20:44:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 28, 2012 at 1:28 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/8/28 Paul Eggleton <paul.eggleton@linux.intel.com>:
>> On Tuesday 28 August 2012 09:37:53 Samuel Stirtzel wrote:
>>> after switching from the Denzil branch to next it seems that the
>>> package order has been changed.
>>
>> You say "next", do you mean denzil-next or master?
> master
>
> Meant the next branch of the setup-scripts:
> https://github.com/Angstrom-distribution/setup-scripts/blob/next/sources/layers.txt
>
>

thats angstrom-next I believe then the question is more relevant to
angstrom-distro ml

> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


