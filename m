Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RXyaS-0006Ki-4U
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 18:13:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB6H6xQS011948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 09:06:59 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 6 Dec 2011 09:06:58 -0800
Message-ID: <4EDE4BB2.2020707@windriver.com>
Date: Tue, 6 Dec 2011 11:06:58 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
In-Reply-To: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
Subject: Re: [RFC] Move package-split of kexec-tools (kdump/kexec) into oe-core?
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
X-List-Received-Date: Tue, 06 Dec 2011 17:13:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/11 10:46 AM, Leon Woestenberg wrote:
> Hello all,
>
>
> meta-openembedded uses .bbappend to change the package-split-up of "kexec-tools"
> (as in openembedded-core) into "kexec" and "kdump" packages (this was classic OE
> behaviour).
>
> http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=0c6d03335c117d24096598a3415ba22f74ec4f6e
>
> However, in openembedded-core we have a dependency on kexec-tools, thus this
> error results:
>
> | * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> task-core-tools-testapps:
> | * kexec-tools *
> | * opkg_install_cmd: Cannot install package task-core-tools-testapps.
>
>
> So the use of meta-openembedded as a layer breaks openembedded-core.
>
> As a solution, can we move this package-split into openembedded-core?
>
>
> Other (neat!) solutions at hand? Maybe a meta-package?
>

That package split seems reasonable to me, along with corresponding changes to 
openembedded-core to choose the "right" kexec-tools..  (in this case since it's 
test apps, we'd want both...)

--Mark

> Regards,
>
> Leon.
>
> thanks 'ant_work' for the pointer to bbappend.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



