Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 125C86025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 16:33:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r124so2191018pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=sDI+GqsZG/v9n5oeoC0U5CvmEGsOGgk1mVecoiRMuN8=;
	b=d9ntn/8twNcXcvtoizEFjlj2baTZVq53Fhv7C+iPPskKhedLXjH2vLCPiy0aOL5r95
	81Xy0VXbtN3w9Z01StpN0lVd0sD0BXIr8Cfnq6pkp6zjaanKuOiJa7TzZNfWDe167Ng9
	tD3Tf6B5BmKNb9UXVTRaSOatB51lYwPcaLtUe5i1ZuyPTxcpnRMJmEO8pCQQ5sbG68+Z
	qQhkcPI6L816vo1C3TfYFzhJi2W8o9uNJm0WRp392a5M5FtdwOKBKPBJAiLkykYUlS3O
	JhtiTFKOK8zaCulYkzL8z1qPvkf/koYZTWg3XeJa1oDmwAYU+ISgTZ28ItbIV0kvmAxS
	3VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=sDI+GqsZG/v9n5oeoC0U5CvmEGsOGgk1mVecoiRMuN8=;
	b=QHnJNPJzzzJUf0ehY67UR0RSedDheqMXA8mvr8TuG8bcK+PxeULPAAsSCSTNl8F797
	Hh2Smsku7nc45nNB8EV26azHiWAa/2WBMcMATmUJgpgsM5qwTP7NTW9FaGhIN4E4xe55
	5se42MVzOqOrtpYnVriIMupZGdIbBFjhrjlIcazEdKKyjkZ6+qB0agJDR2u/fuuotq/l
	RV7M0nTxDp+Ws9xHZu8xhB7JMMYh7q2XhlSdpNoAsZaFP2bf//M4BIUxMzB9XDyy9Pw0
	zAOuH3wNSNQcWsz70PUKcIOQhJ3erH/zfnHmGz/zCpBN5p90Pt7CZu1rxzHNsFsbV6h1
	ugXQ==
X-Gm-Message-State: APjAAAXCwcMf76AphUotvniN1b6p/QDuR7K16T3b3dqjCzeR8TFpY5lm
	XVCL9Mi6hUyj2M98k1Z7ZOZwnTqB
X-Google-Smtp-Source: APXvYqzkqOfVY0YcAcVcoiMpW0FLwqgITEFWctUlULypdxK46pcEQMekhhYBF+1CENZs4jvxqNPZ1w==
X-Received: by 2002:a17:902:2aca:: with SMTP id
	j68mr9388016plb.233.1553099637938; 
	Wed, 20 Mar 2019 09:33:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9d5b:fb53:b464:877c?
	([2601:202:4180:c33:9d5b:fb53:b464:877c])
	by smtp.gmail.com with ESMTPSA id
	14sm3316966pfh.177.2019.03.20.09.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 09:33:57 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190320140929.24410-1-bunk@stusta.de>
	<6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
	<20190320145650.GA31018@localhost>
	<6251ba28-7d83-e490-c564-7e20cdb8b04f@gmail.com>
	<20190320155530.GA1365@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bed849b4-7b7c-89f4-40ca-1581a1e87023@gmail.com>
Date: Wed, 20 Mar 2019 09:33:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190320155530.GA1365@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
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
X-List-Received-Date: Wed, 20 Mar 2019 16:33:57 -0000
Content-Type: multipart/alternative;
	boundary="------------818A48C643349E4668D36395"
Content-Language: en-US

--------------818A48C643349E4668D36395
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 3/20/19 8:55 AM, Adrian Bunk wrote:
> On Wed, Mar 20, 2019 at 08:21:31AM -0700, akuster808 wrote:
>> On 3/20/19 7:56 AM, Adrian Bunk wrote:
>>> On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
>>>> On 3/20/19 7:09 AM, Adrian Bunk wrote:
>>>>> Copyright hash changed to to year change.
>>>> =C2=A0You are missing one of the more important bits of info that wo=
uld help
>>>> make the decision if this gets into M4 or waits until after 2.7 rele=
ases.
>>>>
>>>> Go look at the 9.11.5-p4 release notes.
>>> What part of the release notes are you referring to?
>>>
>>> And why are you talking about release notes for a version
>>> that is neither of the two versions in this upgrade?
>> Ah, because the 9.11.5 has patch level updates from -p1 to -p5 that ar=
e
>> not the current 9.11.5 and those changes=C2=A0 are included in 9.11.6.=

> Most items in the 9.11.6 release notes are also in the 9.11.5
> release notes.

9.11.5-P4=20

  * CVE-2018-5744: A specially crafted packet can cause named to leak
    memory
    <https://lists.isc.org/pipermail/bind-announce/2019-February/001115.h=
tml>=C2=A0
    /Michael McNally /
  * CVE-2018-5745: An assertion failure can occur if a trust anchor
    rolls over to an unsupported key algorithm when using managed-keys
    <https://lists.isc.org/pipermail/bind-announce/2019-February/001116.h=
tml>=C2=A0
    /Michael McNally /
  * CVE-2019-6465: Controls for zone transfers might not be properly
    applied to Dynamically Loadable Zones (DLZs) if the zones are
    writable.
    <https://lists.isc.org/pipermail/bind-announce/2019-February/001117.h=
tml>=C2=A0
    /Michael McNally /


please add just the CVE references to the commit message.


>> Also, nowhere was it mentioned this is a bugfix only update.
> It is not a bugfix only update.

The 9.11 series is a Extended Supported Version. (ESV) release.=C2=A0 Use=
 the
software for Production Environments needing infrequent upgrades and no
new features.

https://www.isc.org/downloads/software-support-policy/version-numbering/

>
>> This helps
>> me in deciding if this is a back port candidate.
> You are saying you were threatening to veto inclusion into 2.7 because
> you aren't able to decide whether it should be backported to 2.6?

Not at all. We have entered 2.7 M3 which includes freezing package
updates. The ones that have the best chance of getting in are ones that
are bugfixes and or include CVE fixes. Without any information, the
chance on being included goes down. Having more info in the commit
message helps Richard and Ross to decide if they should include it.

>
>> Keywords to look for: Bugfix only, CVE's, ABI changes, dependency
>> changes, depreciated functions and new features.
>>
>> I are hoping a little do-diligence in being applied to package updates=

>> otherwise automation will save us all a bunch of time.
> Doing the 9.11.5 -> 9.11.6 upgrade in master is something I wouldn't=20
> have suggested if I wouldn't have considered it reasonable.
Master tends to have=C2=A0 a very liberal update policy, it should now be=

closed for stabilization with the possible exceptions I mentioned before.=

>
> Upgrading bind 9.11.4 -> 9.11.6 in thud is a case where=20
> automation or keywords in a commit cannot make the decision.
> It doesn't look like a clear case either way to me.
>
> The recipe maintainer might be better qualified to analyse
> whether or not this is a backport candidate.

I am the package maintainer and I appreciate folks helping me support
the packages I maintain with in updates and fixes.

regards,
Armin
>
>> Thanks,
>> Armin
> cu
> Adrian
>


--------------818A48C643349E4668D36395
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/20/19 8:55 AM, Adrian Bunk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 20, 2019 at 08:21:31AM -0700, akuster808 wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 3/20/19 7:56 AM, Adrian Bunk wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
On 3/20/19 7:09 AM, Adrian Bunk wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Copyright hash changed to to year change.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap=""> You are missing one of the more important bits of info that would help
make the decision if this gets into M4 or waits until after 2.7 releases.

Go look at the 9.11.5-p4 release notes.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">What part of the release notes are you referring to?

And why are you talking about release notes for a version
that is neither of the two versions in this upgrade?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Ah, because the 9.11.5 has patch level updates from -p1 to -p5 that are
not the current 9.11.5 and those changes  are included in 9.11.6.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Most items in the 9.11.6 release notes are also in the 9.11.5
release notes.
</pre>
    </blockquote>
    <br>
    <pre>9.11.5-P4 </pre>
    <ul>
      <li><a
href="https://lists.isc.org/pipermail/bind-announce/2019-February/001115.html">CVE-2018-5744:
          A specially crafted packet can cause named to leak memory
        </a><a name="1115"> </a>
        <i>Michael McNally
        </i>
      </li>
      <li><a
href="https://lists.isc.org/pipermail/bind-announce/2019-February/001116.html">CVE-2018-5745:
          An assertion failure can occur if a trust anchor rolls over to
          an unsupported key algorithm when using managed-keys
        </a><a name="1116"> </a>
        <i>Michael McNally
        </i>
      </li>
      <li><a
href="https://lists.isc.org/pipermail/bind-announce/2019-February/001117.html">CVE-2019-6465:
          Controls for zone transfers might not be properly applied to
          Dynamically Loadable Zones (DLZs) if the zones are writable.
        </a><a name="1117"> </a>
        <i>Michael McNally
        </i></li>
    </ul>
    <p><br>
    </p>
    <p>please add just the CVE references to the commit message.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Also, nowhere was it mentioned this is a bugfix only update.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is not a bugfix only update.</pre>
    </blockquote>
    <br>
    The 9.11 series is a Extended Supported Version. (ESV) release.  Use
    the software for Production Environments needing infrequent upgrades
    and no new features.<br>
    <br>
<a class="moz-txt-link-freetext" href="https://www.isc.org/downloads/software-support-policy/version-numbering/">https://www.isc.org/downloads/software-support-policy/version-numbering/</a><br>
    <br>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This helps
me in deciding if this is a back port candidate.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You are saying you were threatening to veto inclusion into 2.7 because
you aren't able to decide whether it should be backported to 2.6?</pre>
    </blockquote>
    <br>
    Not at all. We have entered 2.7 M3 which includes freezing package
    updates. The ones that have the best chance of getting in are ones
    that are bugfixes and or include CVE fixes. Without any information,
    the chance on being included goes down. Having more info in the
    commit message helps Richard and Ross to decide if they should
    include it.<br>
    <br>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Keywords to look for: Bugfix only, CVE's, ABI changes, dependency
changes, depreciated functions and new features.

I are hoping a little do-diligence in being applied to package updates
otherwise automation will save us all a bunch of time.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Doing the 9.11.5 -&gt; 9.11.6 upgrade in master is something I wouldn't 
have suggested if I wouldn't have considered it reasonable.</pre>
    </blockquote>
    Master tends to have  a very liberal update policy, it should now be
    closed for stabilization with the possible exceptions I mentioned
    before.<br>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">

Upgrading bind 9.11.4 -&gt; 9.11.6 in thud is a case where 
automation or keywords in a commit cannot make the decision.
It doesn't look like a clear case either way to me.

The recipe maintainer might be better qualified to analyse
whether or not this is a backport candidate.</pre>
    </blockquote>
    <br>
    I am the package maintainer and I appreciate folks helping me
    support the packages I maintain with in updates and fixes.<br>
    <br>
    regards,<br>
    Armin<br>
    <blockquote type="cite" cite="mid:20190320155530.GA1365@localhost">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thanks,
Armin
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
cu
Adrian

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------818A48C643349E4668D36395--
