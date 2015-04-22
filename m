Return-Path: <net147@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 20F77605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 01:35:10 +0000 (UTC)
Received: by qgej70 with SMTP id j70so76995159qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WZtbC9E8Be7hM8pie1RrWdBFrqQz7OOz4tgDTkG8Dek=;
	b=OmcbD7nUe9uBph7opczhlrJWMXBQSZjfeS1mh3ohvzLzcEpAbDbodORdJqgfnmHr9h
	KPOimjgLGQdOQqNxvnWoYazu+Fw8sc+CCQdocDCzTWTpbZ2Jtkt+fvRfErGYOHdTmVC0
	WGrGQ3hAZFNucEPCHr7BlmjXX33ZJKIeBL3EuhrQXox39FAWZ/NcBbjhWIbR6bBCeCBh
	OE+73sC8RSYXgURBFR30pO98PPoXKpbIutVHQapIR0NUgMjprOLslkDDrMOt/QgEtWQh
	EDNwLYVMs5jqrdjGixzbd2HIRDaSewHWKvRw0AP4QgILzABEUgfyxcfc5b0YkyAFwcYm
	pkhQ==
MIME-Version: 1.0
X-Received: by 10.140.150.73 with SMTP id 70mr28066135qhw.10.1429666511875;
	Tue, 21 Apr 2015 18:35:11 -0700 (PDT)
Received: by 10.96.56.100 with HTTP; Tue, 21 Apr 2015 18:35:11 -0700 (PDT)
In-Reply-To: <551353BF.2000803@gmail.com>
References: <1426152047-20625-1-git-send-email-net147@gmail.com>
	<551353BF.2000803@gmail.com>
Date: Wed, 22 Apr 2015 11:35:11 +1000
Message-ID: <CANwerB15P4zp4vdv2vdWXUK2KeryO=t=pOG9R-qPG6=ROOKQTQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [daisy][PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Wed, 22 Apr 2015 01:35:14 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2015 at 11:33, Jonathan Liu <net147@gmail.com> wrote:
> On 12/03/2015 8:20 PM, Jonathan Liu wrote:
>>
>> The ownership needs to be explicitly set otherwise it inherits the user
>> and group id of the build user.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/recipes-core/systemd/systemd_211.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>
> Ping.
Ping.

>
> This is a backport from master:
> http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?id=0752c79282b1cc9699743e719518e6c341d50a3a
>
> Regards,
> Jonathan

