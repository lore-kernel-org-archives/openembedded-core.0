Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id EBBFC6E987
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 20:06:35 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id n16so5828479oag.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 12:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MJ9w4FlOjKqTtzdQj9Vg0aZXCOgKhZ+Uln8Yy6OswdA=;
	b=QaMQtXT3RZDf7ED5JP1sUZ/ct/lmlrmkT4e1q+vLOy3XVydfGLUS/AxQvTHUJUstb9
	dekAoI3WwtHOEEozPnsEjhf7qG6EU/Sm0CPdFnQ9kSnRLmDHu7jQdfZQth0Y7jTbYtg1
	ohhENxAC6zB4g/+ViSvC6DzP8Yr3xQaPfHmd6Fun8K3JJdiqmfYVp38iExpehryf4QR+
	4C9I/w9LrRZI4/FJwwhXZm4LHs1Ow2zvyxa56iNU3VbsbogEHL6eLsLu6ull2Sjpt6jj
	6PPQVrIFaIMTK93E9oJmZSPVYtULCyVSntTxi84xtigX0DwtGnzdAxBWP0BIjX4vkvNv
	NRrg==
X-Gm-Message-State: ALoCoQlQ+2yu2rl5Cro2mJ6f65jV+wwobSf0DLIkw62qh4sEEjd2vYQvNH+qxodVQkqMk071uGwx
X-Received: by 10.182.87.42 with SMTP id u10mr17934354obz.22.1391198796517;
	Fri, 31 Jan 2014 12:06:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Fri, 31 Jan 2014 12:06:16 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jan 2014 21:06:16 +0100
Message-ID: <CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Fri, 31 Jan 2014 20:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 31, 2014 at 8:01 PM, Iorga, Cristian
<cristian.iorga@intel.com> wrote:
> On my Ubuntu 13.10 dev machine, wireless-tools and iw are both installed by
> default (I might be wrong here, maybe I installed them some time ago by
> hand).

you are right, they are both on the default install, see

http://releases.ubuntu.com/13.10/ubuntu-13.10-desktop-amd64.manifest

