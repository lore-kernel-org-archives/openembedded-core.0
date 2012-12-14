Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjVyH-0007Xr-P6
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 15:10:38 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 05:55:10 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so14399810oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 05:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/48ogmAVCwsvBlI9B8qw9YEw3KFGTtRpMfceXeTv/IU=;
	b=D4R+8zRs/SToRA1ot1b7WVFiA14RvMW98bvucbc4S2669SmK02E12nFZncokRibC/n
	ryJyeSIxTwk0B1dSPbh75ziqOKKusXnmA3ErOY3QulZ91C75W3h8tPlieFtFJZh+0HtN
	fh7rN9uMj1GNRyP4DJdAIcjdeT6qwHNwoXmd8KMP2roJFP7Ovgmavdr9yhM93LbfuA0G
	YOBFyWrCHbT6kftP5JT/SGBL8g9JHVgMM30LZDoHxm61j1rp1NcgcP9Kpk3BWyL9Ol9G
	EoodBJaYBxNrGMCiNVIixUBQQ+S4t0e2MrTxQfNB4Fh95hyhHa93lnOcHYa2SKVuzumW
	kvgg==
Received: by 10.60.12.99 with SMTP id x3mr4766705oeb.71.1355493359673;
	Fri, 14 Dec 2012 05:55:59 -0800 (PST)
Received: by 10.60.12.99 with SMTP id x3mr4766698oeb.71.1355493359600; Fri, 14
	Dec 2012 05:55:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 14 Dec 2012 05:55:38 -0800 (PST)
In-Reply-To: <CADV-EXFeZX3RiZZZ1zxZtLaq9bnDUBQ4cEGndecKOvtSog6xwQ@mail.gmail.com>
References: <CADV-EXFeZX3RiZZZ1zxZtLaq9bnDUBQ4cEGndecKOvtSog6xwQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2012 13:55:38 +0000
Message-ID: <CAJTo0LZnqnDgeVUOKxWaxjt+Hp_ptdr_Z3AM66vi4WpK5oFe4w@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQnfiZ2VbHTv5eUfqI3H0GLCS/cp24FfodbwMVjZbtSQFAXeYqO2yAbsxt6+gutoW1K2QinebkGwJ9VEeYRcaM+4luVpAgYpC7IPoNyAXlPmnY5f5tTNlsc0CRQpMzbnCRxepI3UfG86ZiiqajfqHOt6uVLIaKlVrhRa1cpmsOidh9ltIPwr6Sa5x9jK+60if5/HSI1l
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd
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
X-List-Received-Date: Fri, 14 Dec 2012 14:10:39 -0000
Content-Type: text/plain; charset=UTF-8

On 14 December 2012 13:12, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> Is there any way to use systemd for starting system services in yocto v1.3?

Use meta-systemd from meta-openembedded.

Ross


