Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD4FF78312
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:18:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b6so2420620pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=YGz5+wr7/CyhR++IhtSpJZ0QhnkILjcCdlSB7+qPdOY=;
	b=gSqBYmOzqtlppfYYcXnu9XITdwmTUvE8fZcsJqYL5ddhGx9mPzBaUI1nvj0ob7V0SV
	i106FH0tJWAYSFzGaUB1JjG486RnZDACGJdk3y51mxirqNsBUEMH/IBX0Xy4Y76mzX9b
	/TWpoAALp6aTKVDAxYg4C7clHlhwntKo8cGUSUo+sBedbC5Dnb4J98rFvZJ0eZgL+qWZ
	V0cA8/ikTNFGeNWDJqLFdyEYWzM4LQf3bGLU/vdiUpkv3jzBTnHqNlsXjqzjc0DJw0/5
	ZrWlpeU5zbMwtqQQSGL3UmvowPmMNleGBq6jMIHJXd+eLcmImzIxsmZKcEFJ1Da9a6XQ
	bZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YGz5+wr7/CyhR++IhtSpJZ0QhnkILjcCdlSB7+qPdOY=;
	b=LUVdKeVuhFtfmEJ1CI9Wc4LsmtGvrd2LAO+Rc/HjxemjI+3QIs4ANDGxwmnDkedDv1
	Z9fo4ZUGuMB9athFXlpw/mHTuEYR9Pjk3QLleSU7aBMHjchHzMwGHHQkB21sKTVMV//+
	LUCqbxyqGaqbCHzYso+T0otqfQBfURPn8sDHMMujcfoaXCYvILbc5ySXPZ/iLIdbK0bx
	rx1LNNRj2Q6MHM7fExS75HtURIxF13LGpAp1QvfLbxW28aUzevoaAOU8Lqjjm+qpUL+c
	pQvS62m06MEeFb5VJFwnztyo+MfXDeaAMQXUA2200Kj2fmsNFGMeBvOSn3VMCTq85PXe
	YbBw==
X-Gm-Message-State: AMCzsaVVzFXUwaczyoMTZQm7k7J+GTz99Ot+PN4mJdujsx+puW8dIpfy
	ZjQ+MCuC8aCAyptC4vnBzUWs5Q==
X-Google-Smtp-Source: ABhQp+TPpQM+rwL3tbJJSZMBfJTLDtRD/OqXbK/o61jEshWs0CufEdPX5SNGOz63hI91kqJHjK6VNw==
X-Received: by 10.84.253.23 with SMTP id z23mr7030956pll.210.1509722290633;
	Fri, 03 Nov 2017 08:18:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78e5:dcc3:4839:af44?
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	t78sm9284370pgb.93.2017.11.03.08.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 08:18:10 -0700 (PDT)
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171103091147.20243-1-joshua.g.lock@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a547af4c-6ae8-b0f2-446f-e19350b984b6@gmail.com>
Date: Fri, 3 Nov 2017 08:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103091147.20243-1-joshua.g.lock@intel.com>
Subject: Re: [PATCH] scripts/runqemu: when qemu fails to start with kvm retry with kvm disabled
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
X-List-Received-Date: Fri, 03 Nov 2017 15:18:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Joshua,


On 11/03/2017 02:11 AM, Joshua Lock wrote:
> On the Yocto Project Autobuilder we occasionally see qemu fail to start,
> most frequently on Fedora 25, because kvm fails to allocate memory. See:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12058
>
> This patch introduces a fallback path where if the inital qemu command fails
> and kvm is enabled we retry running qemu with the kvm related options
> removed from the qemu command line.

I will backport once this lands in master.
thanks,
 - armin
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  scripts/runqemu | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index df762709043..b7f8b3c4d55 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1168,7 +1168,25 @@ class BaseConfig(object):
>          logger.info('Running %s\n' % cmd)
>          process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
>          if process.wait():
> -            logger.error("Failed to run qemu: %s", process.stderr.read().decode())
> +            # If starting qemu failed and kvm is enabled we try again, with the
> +            # kvm related options removed. This is because we have observed
> +            # failures where kvm is unable to allocate memory (particularly on
> +            # Fedora 25) but where a run withou kvm may be successful.
> +            if self.kvm_enabled:
> +                logger.info("Failed to run qemu: %s\nRetrying without kvm...",
> +                            process.stderr.read().decode())
> +                nokvm_cmd = cmd
> +                nokvm_cmd = nokvm_cmd.replace(' -enable-kvm', '')
> +                nokvm_cmd = nokvm_cmd.replace(',vhost=on', '')
> +                logger.info('Running %s\n' % nokvm_cmd)
> +                process = subprocess.Popen(nokvm_cmd, shell=True,
> +                                           stderr=subprocess.PIPE)
> +                if process.wait():
> +                    logger.error("Failed to run qemu (with kvm disabled): %s",
> +                                 process.stderr.read().decode())
> +            else:
> +                logger.error("Failed to run qemu: %s",
> +                             process.stderr.read().decode())
>  
>      def cleanup(self):
>          if self.cleantap:


