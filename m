Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40AF26AC37;
	Fri, 18 Nov 2016 16:28:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so21075017pgd.0;
	Fri, 18 Nov 2016 08:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=5C4FGA1h1h+36jWYMD2jdIsqNHie4kRx8FjHyTo4m7Q=;
	b=rzM3sev3gaHk58tHZ9oUoc4q35dMQouyd/I5HmShbYY0DUQ9WIK4gZKeS7YXanjXo4
	EDee7KxH111gceQ0MAfh4tEvyjFIkxg/A+bftUaHy/IJ4v+KOnKHwsvFhTuz6rSMirrD
	XkFwc/TeIjDmZ8uXrAsY/FVccL8UBYbBw0pWcSPmreGiJQ0olWAKKvQnJdgcC0X8MbWt
	n+VqpwDyopjQvLJYAsIxZhbIocFT2JgeMoU1qcVjB+sA6txt2zf+NppBlG63tCg3jWmE
	6tqVX+V6prSCq3Id+LXiF1wWIIwBDg21K74Xk9uFrxpct1M53g2IY/sYy/wS6DvSNNTy
	WxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=5C4FGA1h1h+36jWYMD2jdIsqNHie4kRx8FjHyTo4m7Q=;
	b=V+VuETm4aSeIxQ9lw624D8lrcDY6ksKrfzBl2G+y4OwmbgvtFh58Bs+3JmncAcdU9h
	uN7aUDeINGUQSQmOe19VTlD0ReKTJ39q1uyoPcaMki2IJ22N+1KTS7soqRoeDdB3Za5b
	33DRP4SpTLJxDznnLYdslp/qVuxYPnYNrUurUPOTuKE0wl6ewZhIykqf1aoMPnl6NVN7
	1DUnNtSGyPbP0V31I38D91jcJ0cawCSJAXXc6A04/QdwlC+c6GnvtZRIxxiilwHbLG7N
	Qp3wqpOxfIsd7AROU+rXR0u7KLDOcGW5T4sdr2Ka7qh1wYbgVsD03znT0PfmWhwZrm6Q
	F6ZA==
X-Gm-Message-State: AKaTC00awoPlCcKDCZnPhNBMoTmw9hYJE4Sk+3n6F4mcNuVfCweHadKNA9wmINGWLSNhuw==
X-Received: by 10.99.99.195 with SMTP id x186mr1148418pgb.100.1479486506930;
	Fri, 18 Nov 2016 08:28:26 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:31d0:92df:f69d:58e2?
	([2601:202:4001:9ea0:31d0:92df:f69d:58e2])
	by smtp.gmail.com with ESMTPSA id
	c15sm19171340pfd.36.2016.11.18.08.28.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 08:28:26 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <70e3fff2-d9a5-37c3-5e14-5dbcc4e4d37b@gmail.com>
Date: Fri, 18 Nov 2016 08:28:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
Subject: Re: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Fri, 18 Nov 2016 16:28:28 -0000
Content-Type: multipart/alternative;
	boundary="------------E3E2CD36355D9475B57E6E63"

--------------E3E2CD36355D9475B57E6E63
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2016 09:31 AM, Burton, Ross wrote:
> Hi,
>
> Background: uninative is a class that downloads a precompiled host 
> glibc for use in the sysroot, thus isolating the native sysroot from 
> the host environment.  This means greater sstate reuse, as instead of 
> native builds being dependent on the host system they're able to be 
> shared between all hosts.  There is a reference tarball hosted on 
> www.yoctoproject.org <http://www.yoctoproject.org>, and the URL can be 
> overridden by distros if you would prefer to build your own.
>
> We enable this in Poky so that we get greater reuse on the 
> autobuilders, and due to some issues with the C++ ABI the eSDK 
> generation in master now requires uninative to be enabled. The 
> question is: do we now enable uninative by default in oe-core's 
> nodistro (pointing at the yoctoproject tarball), or do we keep it 
> disabled by default and require the user to enable uninative if they 
> wish to build an eSDK?

If Poky wants the default to use a prebuilt uninative that is fine, but 
it should be not be the default in OE.  In the spirit of Bitbake, 
uninative should be a build dependency for eSDK with the option of using 
a prebuilt one.

>
> Personally I'm torn: I don't like eSDK not working out of the box, but 
> I don't really like oe-core nodistro depending on uninative.

Well Bitbake does not work out of the box on every host either. There 
are packages needing to exist on the host as a prerequisite. I see this 
in the same light.
Do we make "Buildtools" a  requirement to use Bitbake?


||||||
> Though enabling uninative globally does mean everything works out of 
> the box, so following the principle of Least Surprise that's what we 
> should do.

I see there are multiple versions, which one works with which release?


- Armin
>
> Ross
>
>


--------------E3E2CD36355D9475B57E6E63
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/17/2016 09:31 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>Background: uninative is a class that downloads a
          precompiled host glibc for use in the sysroot, thus isolating
          the native sysroot from the host environment.  This means
          greater sstate reuse, as instead of native builds being
          dependent on the host system they're able to be shared between
          all hosts.  There is a reference tarball hosted on <a
            moz-do-not-send="true" href="http://www.yoctoproject.org">www.yoctoproject.org</a>,
          and the URL can be overridden by distros if you would prefer
          to build your own.</div>
        <div><br>
        </div>
        <div>We enable this in Poky so that we get greater reuse on the
          autobuilders, and due to some issues with the C++ ABI the eSDK
          generation in master now requires uninative to be enabled. 
          The question is: do we now enable uninative by default in
          oe-core's nodistro (pointing at the yoctoproject tarball), or
          do we keep it disabled by default and require the user to
          enable uninative if they wish to build an eSDK?</div>
      </div>
    </blockquote>
    <br>
    If Poky wants the default to use a prebuilt uninative that is fine,
    but it should be not be the default in OE.  In the spirit of
    Bitbake, uninative should be a build dependency for eSDK with the
    option of using a prebuilt one.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Personally I'm torn: I don't like eSDK not working out of
          the box, but I don't really like oe-core nodistro depending on
          uninative.  </div>
      </div>
    </blockquote>
    <br>
    Well Bitbake does not work out of the box on every host either.
    There are packages needing to exist on the host as a prerequisite. I
    see this in the same light.<br>
    Do we make "Buildtools" a  requirement to use Bitbake? <br>
    <br>
    <br>
    <code></code><code></code><code class="filename"></code>
    <blockquote
cite="mid:CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Though enabling uninative globally does mean everything
          works out of the box, so following the principle of Least
          Surprise that's what we should do.</div>
      </div>
    </blockquote>
    <br>
    I see there are multiple versions, which one works with which
    release?<br>
    <br>
    <br>
    - Armin<br>
    <blockquote
cite="mid:CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------E3E2CD36355D9475B57E6E63--
