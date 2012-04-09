Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SHFjC-0000a8-Ru
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 16:37:59 +0200
Received: by qcso7 with SMTP id o7so2340047qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=jgMQkrKB2MMkN/J18mRs+mBlIf02e8SwOTEBssZXmAU=;
	b=pbZUJ9vCgSEkHnuOfg+Wv8USrVzW6dDgKgYKGOWdGjH3JG6bTHeiTjuksancx4t2xJ
	nlONmNNyoQ/y1LnECnOvbODiJqudBbq8B5PbkIcsPwASMAC/sXBr3Xe0ttVj3QI/cIDl
	JSDsLSDjxN8j+JyCLN7rl6zHRlUkydO8P+UYPVOdxLpR0r9g0btRo9Q1/AHFcPHGgubm
	zHL4v8xnfHr6H9vx6+HdlKoAm/xQQ1sNhrqOwAUlS3q+6ZjfoQnNzXzpb6W/inLrLMqj
	nQ67p43NZ/Xf5rrdmq7AAeI0pSyg3puDmbT8598socWGDDOT4LZDprU73KlC5hXhlVZ2
	Vv0w==
Received: by 10.224.173.194 with SMTP id q2mr4827727qaz.15.1333981721800; Mon,
	09 Apr 2012 07:28:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Mon, 9 Apr 2012 07:28:19 -0700 (PDT)
In-Reply-To: <4F80D4EF.8090704@linux.intel.com>
References: <cover.1333695164.git.scott.a.garman@intel.com>
	<4F80D4EF.8090704@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 9 Apr 2012 07:28:19 -0700
X-Google-Sender-Auth: 6bm-yVsZVof71r5RS6XWJAgNqhs
Message-ID: <CABcZANkYGDJ=bAuPsJp2yVicE5Bm0roq+JZW0KkJYOqN=wDpJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] shadow-native: disable logging to syslog
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
X-List-Received-Date: Mon, 09 Apr 2012 14:37:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 7, 2012 at 4:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/05/2012 11:53 PM, Scott Garman wrote:
>>
>> Hello,
>>
>> This pull request includes a patch to shadow to disable logging to
>> syslog, to prevent sysroot user and group additions from writing
>> entries to the host's syslog.
>>
>> I have build-tested this with core-image-sato (which builds a few
>> useradd-based recipes, such as avahi and dbus) for all 5 of our
>> qemu architectures, while watching my syslog to verify that no
>> useradd or groupadd entries were written.
>>
>
> With this patch applied, the following error was seen on the AB:
>
> | Running useradd commands...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | WARNING: useradd command did not succeed. Retrying...
> | ERROR: tried running useradd command 10 times without success, giving up
>
> Check the AB here:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/369/steps/shell_19/logs/stdio

We've (Mentor) hit this failure, usually from openssh's do_install,
from our automated builds at random over the past week or two.
-- 
Christopher Larson


