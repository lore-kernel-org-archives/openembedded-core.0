Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RoLGr-0001of-DR
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 21:41:13 +0100
Received: by lags15 with SMTP id s15so543869lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ybrEB7usGO5t6qk76334k4WVvEKE47SCL62XN5TbNiY=;
	b=U6nkF64qc9CQKUYh1Suzauu8Jrh6RFSJpyxXdLnW3MqwqAScijYxxyKz0joBKnCxVy
	WOC5V8WbrTc1s2S4YFfe7VdQP/eMeJ7xxgiNUpLuYWUIqZLeD6S/CNbrbDaM8MPtTale
	u9Y4jl6gyrIHjJkhZRCjmbzoPpQCDUnqy8vzg=
Received: by 10.152.131.40 with SMTP id oj8mr600855lab.24.1327091612314; Fri,
	20 Jan 2012 12:33:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.22.233 with HTTP; Fri, 20 Jan 2012 12:33:01 -0800 (PST)
In-Reply-To: <CABcZANn5zbXFwTuXwL2GM1FknKrY1OjBfDv=TTyH1=NRrqqDKw@mail.gmail.com>
References: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
	<CABcZANn5zbXFwTuXwL2GM1FknKrY1OjBfDv=TTyH1=NRrqqDKw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jan 2012 12:33:01 -0800
Message-ID: <CAMKF1soievYHSvbvqyvL0gROW+4v-5fU7FretdXyFfHWbOrJVA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding tools-debug to EXTRA_IMAGE_FEATURES pulls other tasks from same recipe
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
X-List-Received-Date: Fri, 20 Jan 2012 20:41:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2012 at 9:10 AM, Chris Larson <kergoth@gmail.com> wrote:
> On Thu, Jan 19, 2012 at 11:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> I added to local.conf
>> EXTRA_IMAGE_FEATURES += "tools-debug"
>>
>> and now when I do bitbake -g I see that its wanting to build
>> "tools-testapp" and "tools-profile"
>> even though I did not ask them to be added to my image. all these
>> packages are coming from
>> single recipe task-core-tools.bb. If I divide this recipe into 3
>> different recipes where each provides
>> just one task, it then leaves the others out.
>>
>> Since these are meta packages they pull in a lot of stuff. Would it be
>> ok to divide this recipe
>> into 3 individual recipes ? Ideally I would expect that the other
>> packages dont get build even
>> though they are in same recipe but that is not the case at present
>
>
> One option would be to avoid the task indirection and simply set
> PACKAGE_GROUP_tools-debug = "<list of debug tools>"

we do lot of overriding in those tasks it would get
a bit ugly I guess if we moved that info to image.bbclass

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


