Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A9C397DDAC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 05:09:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u17so5610491pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 22:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EdAfXYygFzt7isTXq8iVPtiINdWCQ+QOCho17zxdYbM=;
	b=i1JS0122iTvvxIZLs1EGQNGp5XNLzS46lOSESUKXxwvMTmmPxT6M4EMqJKYCeEk/da
	fiz076rwi7jLeH0nOmL9WEMKL5trlNw6bKFQsq6AfdAobr88otaH2dBwjedTNFS4VM6K
	FG49fKxsOylpPzJchmlK2svB0Gzri2ZLpcqd/C2G80Onfh8BB8Tw2PfT8pmrC5/ei+M+
	fT83KTz1RDoW6ZzG87t7myNvnFhuUkWRta3VhmVjCvjbEtwuxtnPgBNeDz/nOQow+0Iz
	ZK0oKO1hobQbD0SCpJ4kHg5lovWtkhHqhqZAN4y2VkK8J5QEityrwNUdyl00HULww/Mt
	P3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EdAfXYygFzt7isTXq8iVPtiINdWCQ+QOCho17zxdYbM=;
	b=UjweClD4G78a6fCollIRJr9QH5vQBiD63Xq+tmrla1CuKZx0Rtd1igHzZ4sph158OM
	ZNgnJCAwdkLc+yLu02LnAxqD+K/ctMRL38MHLxpX3yzbSu4rmiKTwmCXxzgF393YOJ7K
	yr6fAnvm88LxhZp0t+5mqZngO2+A3Jz1IW+vSjjqAr09DCteyeOzLr6YbWY9k73g32HT
	XyayaUC7d3sK6inmPgPV917Qkxv0j+t2Vlfe02zhh2juIdKmI0IkxBvoxfbFtrgydJhv
	AlavW77VhKW/Xarny/Jxi8GmzDV7SmZ5xcdScPilmppSFB9cZ/slP+d6WtEoxZMU8nQy
	2HrA==
X-Gm-Message-State: APjAAAV8TqOhVhEb8Tcs1yLRKJBDSSiMUIyt2uXkQRDelZONYmPnNcy5
	GMQSlnT+FAQslagKFjVvaVxafJRfACc=
X-Google-Smtp-Source: APXvYqwNH4VCKGOa2GYrOpzwzDUnU+95M82IrNs0nHtOvNaaq05QfvppaxqIy1SstuUN7mL480zjYw==
X-Received: by 2002:aa7:8652:: with SMTP id a18mr70792937pfo.167.1558242574422;
	Sat, 18 May 2019 22:09:34 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	f67sm121158pfa.149.2019.05.18.22.09.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 22:09:33 -0700 (PDT)
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
Date: Sat, 18 May 2019 22:09:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
Subject: Re: [PATCH] python-numpy: Avoid installing copy of f2py script
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
X-List-Received-Date: Sun, 19 May 2019 05:09:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:
> Both python-numpy and python3-numpy try to install the file:
> 
> ${D}/${bindir}/f2py
> 
> which causes an error during do_rootfs since the package manager complains about that.
> 
> The numpy packages create basically copies of f2py script with the following names:
> f2py (on both)
> f2py2 (on python 2)
> f2py2.7 (on python 2)
> f2py3 (on python 3)
> f2py3.7 (on python 3)
> 
> Remove the copy of f2py from python-numpy in favor of using the one from python3
> to avoid installation issues at do_rootfs().
> 

what if one does not install py3 ?

> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>   meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> index 5013789..a1133da 100644
> --- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> +++ b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> @@ -4,3 +4,7 @@ require python-numpy.inc
>   RDEPENDS_${PN}_class-target_append = " \
>       ${PYTHON_PN}-subprocess \
>   "
> +
> +do_install_append(){
> +        rm ${D}/${bindir}/f2py
> +}
> 

