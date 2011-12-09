Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ8JL-0003Ie-Lb
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 22:48:55 +0100
Received: by lahd3 with SMTP id d3so1285499lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 13:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=u0ltpbRwuwas/gSQg7iDGxMNz2wuabbrWxcsy+Df0F4=;
	b=WymIu7+LuelFC5nnc0PwRhZtUo8bG2ygLK8IllXrT+O/8pdh4r4kJdBkk2hRbv2A1N
	FNMQQ7erDCn1cbdBXKRTxVsCh4AM0IRyCZieVrHO1Z1+wK8j2hfZXty4l8NxoNaOHyfl
	elS29IIwBWtM3uLewD23nawUc88AeF1ta0sxU=
Received: by 10.152.145.233 with SMTP id sx9mr5997312lab.6.1323466924404; Fri,
	09 Dec 2011 13:42:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 13:41:33 -0800 (PST)
In-Reply-To: <4EE2696A.3090605@linux.intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
	<1323437428.5309.154.camel@ted>
	<CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
	<4EE2696A.3090605@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 13:41:33 -0800
Message-ID: <CAMKF1sqtHZkKA=pryhKg6jB=eymLU-gqzjRBwuZeiQECu34s9g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Fri, 09 Dec 2011 21:48:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2011 at 12:02 PM, Joshua Lock <josh@linux.intel.com> wrote:
> On 09/12/11 11:57, Khem Raj wrote:
>> On Fri, Dec 9, 2011 at 5:30 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> The above line is a bashism and is breaking builds with dash
>>> as /bin/sh :(
>>
>> I thought bashism was too deep in oe. I can certainly revert to using dash if
>> thats no longer the case.
>
> Richard made a concerted effort to enable Dash recently based on
> feedback we received for the Yocto Project. I certainly think we should
> strive to be POSIX shell compatible where possible.

agreed


