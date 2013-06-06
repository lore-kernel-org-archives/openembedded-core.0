Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 841626A5E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 19:18:19 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ey16so692721wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 12:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=MIDSRWYzY4PI9k7+2sxx1yfR0grbY9TGXrWDTtaFdwI=;
	b=bg9mwbCUzJneENsfakFofCacI9+EnM/x2kWOzCscPAh/aJRfpfvZO7d2fyHJTcfV5n
	d1YB2Z2xSFbRu21J0+K3pJseiFGR5+MIxsCyZ83oKSNYXZrqps5SP7gbKZnX3yjL9mt0
	JGGAnjPswMb3Ifvs98T3HVCGJXSsyLOeE1mXvP9uPfum759bODQmTOWWCuo2+p+Jt9bY
	YgsIkyGRA99si8oToIPgfAOEmI3UohKiLIF5UhaDHoOvE8q3E8t11TzSKj4V+Vl7nI0h
	iOxvC44koOyOa3Tbi7JR+yxI3wzOnaVunZDSmmk+IE8OmIQhP4jT5M0TL9/4kN5uTzp0
	T6hg==
MIME-Version: 1.0
X-Received: by 10.180.11.176 with SMTP id r16mr10632280wib.58.1370546299956;
	Thu, 06 Jun 2013 12:18:19 -0700 (PDT)
Received: by 10.194.59.203 with HTTP; Thu, 6 Jun 2013 12:18:19 -0700 (PDT)
In-Reply-To: <14899581.O0scG6jzAS@helios>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
	<14899581.O0scG6jzAS@helios>
Date: Thu, 6 Jun 2013 12:18:19 -0700
Message-ID: <CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlKWoUsYBskseC+w1y//WfgLuzBRSkP+jIgTJXULhxAhntB0hx1QgfF9r2atKJUQoAylOQA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 19:18:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 2:54 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
>> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
>> > On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>> >> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>> >>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>> >>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>> >>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>> >>>> variables defined in qconfig.pri.
>> >>>>
>> >>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>> >>>> so that it can be located by qmake.
>> >>>
>> >>> There is such patch already:
>> >>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>> >>> 4.
>> >>> html
>> >>
>> >> Got lost in my queue, adding it for the next MUT.
>> >
>> > FWIW I am still concerned by the assertion in the commit message about it
>> > causing undesirable behaviour. I'd want that checked out and the note
>> > removed before we look at merging this.
>>
>> OK, I will shelf this until I hear more about the testing of this change
>> regarding the original patch's note.
>
> So I tested a rebuild of qt4-x11-free with Felipe's patch and two of
> Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty value" and
> "classes/qmake_base: allow parallel make"), and did not observe any unexpected
> behaviour and buildhistory looks clean for qt itself and fotowall/quicky. So
> I'd say feel free to throw these into MUT, but I think we need to drop the
> note.
>

Awesome.

Thank you,
Felipe

