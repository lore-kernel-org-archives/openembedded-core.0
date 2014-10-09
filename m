Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id E0F777170B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 22:15:43 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 142so1133174ykq.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 15:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=eMnr6O8xcY1+RXDIcPALXPZ0ThkSg87QglZu0C3Hz1A=;
	b=z01+2OoZwzfUoe3CXb6xfIpvI3VjFE/mJtiY/St27KHA0UjuYMoAIU2liz1G4y1WfL
	6MBsWFtJ5UDlIUzL8Z3/FnqNW0ntJvyesHDcyB8Fantyj1gZePZeFeopdESG363WTM9S
	6H4MBts6kqHzGL0UyVqHxEt+5x8NFaCPLcPZFOzKDbuDZJALQpAHm1Etlzk55wRxEipm
	1ciVOgB+Z+sdkwBcLtThPCD9C05zNhAGRrEpyA1kPZ345J3N+3W7aIQG9LBNXEkgKbvf
	ViHh84ZzOdTfOOvjFTxKh3JzkqkPqj+fPHHsAr8ed8VImMGlxefhhCijh7w2b+hwbeTl
	F/4w==
MIME-Version: 1.0
X-Received: by 10.236.177.70 with SMTP id c46mr1514423yhm.90.1412892944126;
	Thu, 09 Oct 2014 15:15:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 9 Oct 2014 15:15:44 -0700 (PDT)
In-Reply-To: <1412884615.871.24.camel@ted>
References: <54354CBD.6040506@topic.nl> <5436445C.5020503@topic.nl>
	<1412884615.871.24.camel@ted>
Date: Thu, 9 Oct 2014 19:15:44 -0300
X-Google-Sender-Auth: JptBhBVU3XgRx2XqgbHRA_c5_58
Message-ID: <CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request to move "gitpkgv.bbclass" from meta-oe to oe-core
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
X-List-Received-Date: Thu, 09 Oct 2014 22:15:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2014 at 4:56 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
>> =EF=BB=BFIn partial reply to my own question, this has been discussed 2 =
years ago, but
>> apparently nothing ever came out of it.
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2012-February/=
056050.html
>>
>> So once more the request to be able to get sane version strings for git =
repos.
>> Can we please just move gitpkgv. That's like five minutes work, and if a=
nyone
>> (e.g. me) feels like building something better, he or she is free do sub=
mit
>> that and get rid of the gitpkgv class once it's obsolete.
>
> I do feel quite strongly that this is something which should get
> improved in the fetcher itself. That is why I've pushed back on the
> patch since if I take it into OE-Core, there is even less incentive to
> fix the real problem...

Mike I am also an user of gitpkgv but I must to agree with Richard
here. Moving this to OE-Core will just make it worse. It is way better
to prepare a patch and add support for it on the fetcher code of
BitBake.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

