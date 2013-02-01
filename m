Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1EAU-0006nz-73
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:48:27 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 02:32:40 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so5272534ghb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=fLdUSALXC0Ax/8H35at0EwQS2t6XEaaXOen64shJcpo=;
	b=VCUKX6u1IBmQ7C9d8Y6S9U1UVsRKlavtMK24A3ZEp2b3I8yY20sHp7He9DLhoCZ8K0
	8Mj0D2f0y7vI0uSHepEq2b5Xe4vbbfL7PwPwmxYb8USviSpiViap5UWezUg7+DCmxZkh
	LSeFkIef+YqIROEF4iZAivLsASFN90Zla06IHV5f7o+OtMucbH3Xb4nzFG1SDoDmvPTQ
	FIIYUoNEirswNhtPE5LOVL9evlQgMUsEtnbBrv57h1CNFdeevkm0UGuFVQUTuOGnW+gy
	CTc7lfqnTa8OAgcdC+O9n9JKvSvJYAFE9B957c/kWd8yvw61z4cd0ckW8ule0fXliU5+
	0aHA==
X-Received: by 10.220.116.5 with SMTP id k5mr10866323vcq.55.1359714759969;
	Fri, 01 Feb 2013 02:32:39 -0800 (PST)
X-Received: by 10.220.116.5 with SMTP id k5mr10866314vcq.55.1359714759823;
	Fri, 01 Feb 2013 02:32:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 02:32:19 -0800 (PST)
In-Reply-To: <510B8C52.4020700@oss.bmw-carit.de>
References: <510B8C52.4020700@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 10:32:19 +0000
Message-ID: <CAJTo0LZGYW4Q8smAh8K863D++K_H4hcndwYWYFJrgPjd8rd-wQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
X-Gm-Message-State: ALoCoQmWw7GfQwOgEPft8le+UcDgssw0Qu8SOhBCV/2QeqFcBupHfir9ozBj1KL0NB/4SQMizKo5mb8t5rDoF6x6rph1UfWZCHDPT3Oceo1xH6sxLu5EuEl1KbqiBmi9xMHq1UIa8O6DPitH24t2dmr6HhP6zJhlWFyOyX1ZqQVscD4yfC8riCEOpgyOy+XFYqERogYErCb/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Two recipes with the same file name for the SRC_URI
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
X-List-Received-Date: Fri, 01 Feb 2013 10:48:30 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 09:35, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> I ran into the following issue with bitbake:
> I have two recipes, where the SRC_URI of both recipes have the same file
> name (but of course, different URLs), e.g. SRC_URI =
> "http://foo.com/src.tar.gz" and SRC_URI = "http://bar.com/src.tar.gz".
>
> Now when I want to fetch both of them, bitbake does not download both of
> them because they have the same name, and it assumes the file is already
> downloaded if one of the files is downloaded.
> Is there an option to set the local file name after downloading in the
> recipe? The OpenEmbedded Manual does not mention any.
>
> Or is there another way to solve the problem? Using Google and searching
> through the manual did not help me.

Try the "downloadfilename" option, i.e.
http://bar.com/src.tar.gz;downloadfilename=bar-src.tar.gz"

(if this works, it should be added to the manual)

Ross


