Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QX95D-0006hx-Aj
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:41:51 +0200
Received: by pvc30 with SMTP id 30so1052642pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Jc+Pycqg9YUaiQFnQJj3TXzFYp8Y0nKeaWcLIac8kAg=;
	b=n3jj+T8+VV2oghJyOz+MBgFslk7oNsEixQ31vIy2XJ8j6XycIsZ38q+5Qzp/Du/ZDS
	7P5VnsoI2rYgdD3wIWDrA8UoZsq+D7C+xm4OKH8vY6hl7HxM+Q+zZ4ez+8qYyw6OvuQJ
	TSNe8RUmG6o83mKG442Jv1zq8Vjdc6jbUTGRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J+h6xXAqx7pJDk/sx2nnQR+s1Z+brSVXszN+aoIFo8J7si5yvuCRt69kcqzh0Elsqz
	ipKPV8kWu64qSrKpv4rUlBAeA9yHa7uKwjadWXnR1erFxXzTgm80loYZQFf6aLGIwIfJ
	bgcG2dxYFavnDwbRYbMcEZl98WKvlynZGybp0=
MIME-Version: 1.0
Received: by 10.142.249.38 with SMTP id w38mr101176wfh.241.1308217102403; Thu,
	16 Jun 2011 02:38:22 -0700 (PDT)
Received: by 10.142.174.6 with HTTP; Thu, 16 Jun 2011 02:38:22 -0700 (PDT)
In-Reply-To: <24c31ebbed038d3dda2e9a0a97bcd9fe4fe89a8d.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<24c31ebbed038d3dda2e9a0a97bcd9fe4fe89a8d.1308215406.git.dongxiao.xu@intel.com>
Date: Thu, 16 Jun 2011 11:38:22 +0200
Message-ID: <BANLkTikCyjfiANSyxgtwyt5vH6f2LjN7iQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] initscript: Change some order of init scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2011 09:41:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 16, 2011 at 11:20 AM, Dongxiao Xu <dongxiao.xu@intel.com> wrote:
> Move udev script to execute ealier since module autoload needs it to
> create device nodes.
>
> Also move sysfs before udev which has dependency on it.
>
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
<snip>

There was a drawback doing that: kernel modules loaded in unpredictable order:

http://patches.openembedded.org/patch/1917/

Is that still an issue?

Regards

Andrea


