Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SYyAv-0004Hd-0W
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 13:31:49 +0200
Received: by vbbfr13 with SMTP id fr13so2076828vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 04:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:x-gm-message-state;
	bh=KZ/Dx97BQvAPDrNOZ0v4rTDf7DftJeXXF6rsCmH9o5g=;
	b=mANnheFf3fcrNAzEy5bWzLWq4P7ra6ZA3OmgXa5vUu8SzcGFtJi42TmBeWYnVc1IM6
	ouN9F/ury2pqpnQXK6PbbHHLf3HtTFHBznSjWggd3u44pmPuorOjfkFLPgKuH0VmlInH
	ZNUNB9Ghr/c/ONpX+/YE0TgZFZXjfpJwYJxmyLavyUiLZsXQE+uE/cLNyD7dL5Yzdx43
	wbVSMG5T8sC5tO0OlxPTyiWDmgf1vC2Pajr8VImEfRC6GqjvI/vwE+Nh4GvrlzKbUIR1
	KXsYBGGNNkFgO3Tr9knOBbS5GNkes6eqA4AaniMPooGrNPVPYiY18tCIIpXs7u7xP+cG
	O5ag==
Received: by 10.52.98.226 with SMTP id el2mr6925066vdb.119.1338204092371;
	Mon, 28 May 2012 04:21:32 -0700 (PDT)
Received: from [128.224.170.186] ([89.121.200.106])
	by mx.google.com with ESMTPS id i19sm18451932vdt.18.2012.05.28.04.21.31
	(version=SSLv3 cipher=OTHER); Mon, 28 May 2012 04:21:31 -0700 (PDT)
Message-ID: <4FC35FBA.2060200@gherzan.ro>
Date: Mon, 28 May 2012 14:21:30 +0300
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com>
In-Reply-To: <4FC35FAD.7090505@intel.com>
X-Gm-Message-State: ALoCoQk5TCeXJvyrLDoaS81csawbT3Cvnh0LxmhNX25HuZ0/Osr3lzXo0xxOtm31P7SdblzQsG0v
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 11:31:49 -0000
Content-Type: multipart/alternative;
	boundary="------------060403090003000606050904"

--------------060403090003000606050904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2012 02:21 PM, Radu Moisan wrote:
>
>
> On 05/28/2012 01:55 PM, Burton, Ross wrote:
>> Hi,
>>
>> First, sorry for the thread breaking, I've just joined this list and I
>> didn't get this mail.
>>
>> Koen Kooi wrote:
>>>>   dbus: Update to version 1.5.12
>>> First: how was this tested?
> the only testing I've done so far is to ensure it build and then check 
> the version with dbus-daemon --version

Dbus comes with a test suite. Running those should be a must.
>>> Second: From the dbus website:
>>>
>>>         The current stable branch is D-Bus 1.4.x. This is the recommended
>>> version for most purposes.
>>>         The current development branch is D-Bus 1.5.x, which will lead to a
>>> 1.6.x stable branch in future.
>>>
>>> Why are you deleting the stable branch based recipe and add one from
>>> the development branch?
>> The definition of stable and unstable in DBus isn't as hard and fast
>> as you'd really like -- the 1.5.x cycle is very slow and mostly stable
>> from a crashy point of view.
>>
>> I'd say there is a good rationale for having both 1.4.x (.20, so that
>> also needs an upgrade) and 1.5.x in oe-core.  The default should be
>> 1.4 for obvious reasons (it's the stable release), and 1.5 should be
>> there for people who need the improvements.  In particular there has
>> been a lot of work on performance, so anyone heavily using dbus (i.e.
>> anything using Telepathy, which is where the improvements came from)
>> should look at 1.5 because it will give a noticeable improvement on
>> slower hardware.
>>
>> Ross
> I suppose, then, I should add another recipe and support both. 
> However, can someone point out how can I make one of them default.

DEFAULT_PREFERENCE

@g

--------------060403090003000606050904
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 05/28/2012 02:21 PM, Radu Moisan wrote:
    <blockquote cite="mid:4FC35FAD.7090505@intel.com" type="cite">
      <meta content="text/html; charset=ISO-8859-1"
        http-equiv="Content-Type">
      <br>
      <br>
      On 05/28/2012 01:55 PM, Burton, Ross wrote:
      <blockquote
cite="mid:CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com"
        type="cite">
        <pre wrap="">Hi,

First, sorry for the thread breaking, I've just joined this list and I
didn't get this mail.

Koen Kooi wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">&nbsp;dbus: Update to version 1.5.12
</pre>
          </blockquote>
          <pre wrap="">First: how was this tested?</pre>
        </blockquote>
      </blockquote>
      the only testing I've done so far is to ensure it build and then
      check the version with <font face="Droid Sans Mono">dbus-daemon
        --version</font><br>
    </blockquote>
    <br>
    Dbus comes with a test suite. Running those should be a must.<br>
    <blockquote cite="mid:4FC35FAD.7090505@intel.com" type="cite">
      <blockquote
cite="mid:CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com"
        type="cite">
        <blockquote type="cite">
          <pre wrap="">Second: From the dbus website:

&nbsp; &nbsp; &nbsp; &nbsp;The current stable branch is D-Bus 1.4.x. This is the recommended
version for most purposes.
&nbsp; &nbsp; &nbsp; &nbsp;The current development branch is D-Bus 1.5.x, which will lead to a
1.6.x stable branch in future.

Why are you deleting the stable branch based recipe and add one from
the development branch?
</pre>
        </blockquote>
        <pre wrap="">The definition of stable and unstable in DBus isn't as hard and fast
as you'd really like -- the 1.5.x cycle is very slow and mostly stable
from a crashy point of view.

I'd say there is a good rationale for having both 1.4.x (.20, so that
also needs an upgrade) and 1.5.x in oe-core.  The default should be
1.4 for obvious reasons (it's the stable release), and 1.5 should be
there for people who need the improvements.  In particular there has
been a lot of work on performance, so anyone heavily using dbus (i.e.
anything using Telepathy, which is where the improvements came from)
should look at 1.5 because it will give a noticeable improvement on
slower hardware.

Ross
</pre>
      </blockquote>
      I suppose, then, I should add another recipe and support both.
      However, can someone point out how can I make one of them default.<br>
    </blockquote>
    <br>
    DEFAULT_PREFERENCE<br>
    <br>
    @g
  </body>
</html>

--------------060403090003000606050904--
