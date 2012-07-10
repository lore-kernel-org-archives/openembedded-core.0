Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SoeIL-0003kv-Ba
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:32:17 +0200
Received: by ggnp4 with SMTP id p4so238748ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QXyVxFdlxs8KRZ240ZYsAOx58gFnu13hplvI+a88GpY=;
	b=SRaEIeF0ymTjk27uXR/Ks5A9Tf7vZ3XOrw0fcwKqb0jo41I8m39S1o+Wu0yhtkjuON
	TG6WbLieQxzOa92LowPAvY8P0com+SCi7fRGpz49AJjcX1u/ZchA/N34gz9Z8gvo4DGJ
	VjU080IVzcPuom+4C0jkyj8YzQhpOHU0YVakQXq/Zv77pEx1jAnICJ9J6EqA4FL/FXya
	IJi+KLkHySfMYJcrhxKyKSU8RdwWUPP/8rqG/VNklGSIpSiB+paFl12xZjTVvBD/EVrO
	MZB6SDoeCrtZBv/x9QC0PloUTdDyOYUQWrEiTQcIxx5oSi8tqGlsKUnMLMXOHckjhqNO
	U/Qw==
MIME-Version: 1.0
Received: by 10.50.236.71 with SMTP id us7mr12069202igc.16.1341940865996; Tue,
	10 Jul 2012 10:21:05 -0700 (PDT)
Received: by 10.231.20.74 with HTTP; Tue, 10 Jul 2012 10:21:05 -0700 (PDT)
In-Reply-To: <1341940417.20265.92.camel@phil-desktop>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
	<1341940417.20265.92.camel@phil-desktop>
Date: Tue, 10 Jul 2012 13:21:05 -0400
Message-ID: <CADkTA4Mg8x3BXsxu5PWsG-cv14qyQNn+i07+xpye6xoPe3HcxQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Tue, 10 Jul 2012 17:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 10, 2012 at 1:13 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
>> We shave too much from kernel sources for making it work
>> for on device external kernel module development that cross
>> development of external modules wont work from same tree
>> anymore. This patch makes a copy of tree which will eventually
>> be staged for building external modules
>
> Why does cross development require more of the kernel tree than
> on-device compilation?

From what we were discussing on IRC yesterday it is the binary tools that
are being stripped (and then regenerated) on the on-target builds. We can't
package them up, since they are in a -dev package.

Cheers,

Bruce

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


