Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com
	(mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
	by mail.openembedded.org (Postfix) with ESMTP id EAA8061024
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	subject:from; bh=tuz9f10FgbkICZ1h3/nIrAq1BBb82L0K4CdJToubXyo=;
	b=jS0c2CYbw1zpYkDJkoEodokfE202rFLjcjG1HJ80eHArarRZTqnxnW2z9oCL+8lAH/wakqexSF/R7
	F4iCsH/PbiXUHXMHH8KXZNCrsOK+JjFZUXVC5NcP50nNXuLMhRDL0FERIIicp5uHnfz9vz78AkS3sN
	WFMBA4u8EH0OWV7Rg7x5uoZvONPLUqjUG2W5X+k8HNTdANZL5pAk+4Z5vzGvnNP1+1fhrLD8ti0Vj/
	uyfmicAP7ZsYWB7O98dCqn8s2i7IlsU5BE3n68zLkjH8mEv+vJJwFclRh0++QjKulgO/rBlMUehVxC
	KXlsK+WckbRwb7UYWqd0IAavZvgJAkQ==
X-HalOne-Cookie: 83e3fd4dcc6ddd282998d5672add5a0a613f9291
X-HalOne-ID: c34d8c9c-6307-11ea-8c79-d0431ea8bb10
Received: from [192.168.178.22] (x4db4211c.dyn.telefonica.de [77.180.33.28])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id c34d8c9c-6307-11ea-8c79-d0431ea8bb10;
	Tue, 10 Mar 2020 19:45:58 +0000 (UTC)
To: Ross Burton <ross@burtonini.com>
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
	<f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
	<CAAnfSTt5fwx3a7pPotvqrwgW58+n-UxCQiZqiAFuuJz6K+=aqg@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Message-ID: <1c4e1685-7b74-0dea-e08f-4887fca9eb66@embexus.com>
Date: Tue, 10 Mar 2020 20:45:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAAnfSTt5fwx3a7pPotvqrwgW58+n-UxCQiZqiAFuuJz6K+=aqg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Tue, 10 Mar 2020 19:45:59 -0000
Content-Type: multipart/alternative;
	boundary="------------DCE532143784B84DB660F8CB"
Content-Language: en-US

--------------DCE532143784B84DB660F8CB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 10.03.20 17:11, Ross Burton wrote:
> On Mon, 9 Mar 2020 at 07:45, Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> Adrian is making a point here, The Yocto Project by claiming that it
>> supports security patches for Stable releases is misleading the Users!
>>
>> I work with different customers and some of them think that by using and
>> pulling the latest releases they will get the CVEs automatically fixed!
>>
>> YP should state that CLEARLY! Of course it will impact the choice of
>> going with Yocto or Not ( probably NOT in this case).
> What would the alternative to Yocto be, and what is their security
> policy?  Does e.g. buildroot commit to fixing every known security
> issue (which is more than just known CVEs) in their releases?


Security patches support is definitely for many companies a knock-out 
criterion.
Probably in this case Debian or a commercial OSes like Qnx would be a 
choice for who can afford it.


Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


--------------DCE532143784B84DB660F8CB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10.03.20 17:11, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAnfSTt5fwx3a7pPotvqrwgW58+n-UxCQiZqiAFuuJz6K+=aqg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 9 Mar 2020 at 07:45, Ayoub Zaki <a class="moz-txt-link-rfc2396E" href="mailto:ayoub.zaki@embexus.com">&lt;ayoub.zaki@embexus.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Adrian is making a point here, The Yocto Project by claiming that it
supports security patches for Stable releases is misleading the Users!

I work with different customers and some of them think that by using and
pulling the latest releases they will get the CVEs automatically fixed!

YP should state that CLEARLY! Of course it will impact the choice of
going with Yocto or Not ( probably NOT in this case).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What would the alternative to Yocto be, and what is their security
policy?  Does e.g. buildroot commit to fixing every known security
issue (which is more than just known CVEs) in their releases?</pre>
    </blockquote>
    <p><br>
    </p>
    <tt><span style="color: rgb(34, 34, 34); font-size: 16px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; letter-spacing: normal; text-align:
        left; text-indent: 0px; text-transform: none; white-space:
        normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;"></span></tt>
    <p><span style="color: rgb(34, 34, 34); font-family: arial,
        sans-serif; font-size: 16px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        letter-spacing: normal; orphans: 2; text-align: left;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;"><tt>Security patches
          support is definitely for many companies a knock-out
          criterion.<br>
          Probably in this case Debian or a commercial OSes like Qnx
          would be a choice for who can afford it.</tt></span></p>
    <p><span style="color: rgb(34, 34, 34); font-family: arial,
        sans-serif; font-size: 16px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        letter-spacing: normal; orphans: 2; text-align: left;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial;"><tt></tt><br>
      </span>
    </p>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------DCE532143784B84DB660F8CB--
