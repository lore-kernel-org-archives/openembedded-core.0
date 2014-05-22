Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (unknown [209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 922D566117
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:56:39 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so3352030yhz.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+KEbkH8EUq63+LrLYxVqvXthG25mXi7TYF7UCPtTJFM=;
	b=V52gvR8CGWa0WCTLuItLdPH9udnBKSPnpOWvLmkXD2QxuFU5ojHrmCRk00NeBqVKvi
	jKM44wx3alDw4KqOEj93fBT/PU0dgKfKUwR/vtBFQpa3ZPyT/ZzfI1L6fPRSeVp5qogv
	SPFXU4xqUOV2wBV+HzZYaiQ4AutnNtJVU5epdpAFefEN5/mGyP242XpZg4vQyiXlGmAO
	SHUWNcXXUkmCTInfAQ0qQ/13zw6xW6HpeiZRqV638YZkQY7NfywLeTD4bxqqRJ/6Wcyf
	Xx0L4WINIKvEWWGuwfdCxHN42JVQ+p0r7gh82BhHNF1lo/wueLgraG0GcIkVDid73kjo
	4Muw==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr86660587yhm.47.1400785000486; 
	Thu, 22 May 2014 11:56:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 22 May 2014 11:56:40 -0700 (PDT)
In-Reply-To: <537E464F.10700@linux.intel.com>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
	<537E464F.10700@linux.intel.com>
Date: Thu, 22 May 2014 15:56:40 -0300
X-Google-Sender-Auth: AMKUgG-V-q0CKZ2EBBDng2qF0vU
Message-ID: <CAP9ODKrmQu+dSDm-5xQUDDsLn+wG9Y96Hj-GRkQunqFyTw4kig@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>, Denys Dmytriyenko <denys@ti.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy-backport][PATCH 0/6] Daisy backports
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
X-List-Received-Date: Thu, 22 May 2014 18:56:41 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

(Adding Denys in Cc)

On Thu, May 22, 2014 at 3:47 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/22/2014 11:27 AM, Otavio Salvador wrote:
>>
>> Hello,
>>
>> Those are the changes I have in my local backport branch which I run
>> on top of 'sgw/daisy' branch.
>>
>> Chen Qi (2):
>>    tcf-agent: add systemd support
>>    gdb: add PACKAGECONFIG for babeltrace
>>
> These are already in my branch

Good.

>> Denys Dmytriyenko (3):
>>    cryptodev-linux: move to recipes-kernel to be shared with module and
>>      tests
>>    cryptodev-linux: create common .inc file to be shared by module and
>>      tests
>>    cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
>>
> I have pulled these for testing, but we don't normally enable new
> functionality in point releases.  I would like to get a clear justification
> as to why these are needed to be back-ported.
>
> Please provide more details on the cryptodev functionality and why it should
> be backported.

We need those to use crypto support in some SoC as is the case for
Freescale (in meta-fsl-arm) and TI (in meta-ti). Unfortunately this
has been sent late in the release but with the drop of ocf-linux it
makes sense to provide cryptodev in my opinion.

Denys?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

