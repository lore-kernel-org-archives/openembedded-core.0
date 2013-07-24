Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9D50760664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:40:41 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so14283739obb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Gm8xye2UsADTUaETZj1CgTF13/mVgFVUUAXqthBLhyo=;
	b=j+AYS3DIEpDbYv0SA3x2yHgWPG1VWMrIhNW71Dhdl++pLnE6Exgf/MlYR//g5Iwjog
	iCdLSKrh2wLkurUjg0NpqR4opz54XhPsADFpsfxEtL32aQJG8vI7MJAFoYYL3fxvtL89
	u9H5DIpc07OHn1mRlPRg9JYpk+Z1EYAsHn1OjQmDQJpivwdjoZVSXX+dpZxP/rutq6oY
	jUtVTkgOH5o7C1nHM/o5EziKVz0GrtVakjDALHHHvZ7r47kHBZEVhTNHHgEYuHqxt4M1
	3oGw//6+X8S0CZ/9H/rtXchIuOqiW72rHklnfHRvnK+v71b5wzl5hEs21Y69iw00Efx4
	IoYA==
MIME-Version: 1.0
X-Received: by 10.182.165.133 with SMTP id yy5mr33474994obb.89.1374705642331; 
	Wed, 24 Jul 2013 15:40:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Wed, 24 Jul 2013 15:40:42 -0700 (PDT)
In-Reply-To: <CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
	<CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
Date: Wed, 24 Jul 2013 19:40:42 -0300
X-Google-Sender-Auth: 3rqwy8hDFmqTq1YCYjPUc5t8wJo
Message-ID: <CAP9ODKrwQfK9=mArwGbJk1E2-8G+_QvFZ3ehU+fKqYvPY5xLjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 22:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 24, 2013 at 7:34 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson <clarson@kergoth.com> wrote:
>> ...
>> > The standalone systemd-tmpfiles recipe I've created has a fairly small
>> > set
>> > of dependencies: intltool-native, dbus, libcap. Given this, I'd like to
>> > propose transitioning away from populate-volatiles to systemd-tmpfiles,
>> > even
>> > for non-systemd images. I think that the update-tmpfiles shell script
>> > may be
>> > of use in a transition, but before we even begin discussing a transition
>> > path, I'd like to request comments on the notion of moving to it at all.
>>
>> I think it shouldn't be hard to make an C app or script which could
>> parse systemd-tmpfiles and use this for non-systemd systems. What do
>> you think?
>
>
> I considered this too, but systemd-tmpfiles supports quite a lot more than
> volatiles, for example restoring selinux labels. Maybe that sounds fun to
> you, but it sounded like more trouble than it was worth to me, given
> systemd-tmpfiles can be used without systemd :) But yes, it's definitely
> another option to consider.

Sorry, pressed the send button too fast ...

I understand but I think we could solve the tmp files issue only;
people using sysv are expected to solve all those other issues in
another way so it is not a regression for them.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

