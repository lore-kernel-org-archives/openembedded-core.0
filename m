Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RWbpX-0001gJ-QF
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 23:43:45 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 9D210D37F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 23:36:57 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AncgAIpS2U5T4zgTPGdsb2JhbAAMN6pEAQEBATeCJAEBAQEDAQEBawoRCxgJFg8JAwIBAgEVARsUBg0GAgEBiAu2boshBJI5giGSFQ
X-IronPort-AV: E=Sophos;i="4.71,286,1320620400"; 
	d="scan'208,217";a="228019431"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 02 Dec 2011 23:36:57 +0100
Message-ID: <4ED95308.8030701@emagii.com>
Date: Fri, 02 Dec 2011 23:36:56 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>	<4ED77E14.1080309@balister.org>	<878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>	<4ED7ABF9.5000109@emagii.com>
	<5D177C90-C498-49C3-8FE3-AE1589ADB5A3@dominion.thruhere.net>
In-Reply-To: <5D177C90-C498-49C3-8FE3-AE1589ADB5A3@dominion.thruhere.net>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 02 Dec 2011 22:43:45 -0000
Content-Type: multipart/alternative;
	boundary="------------090605030408070707010304"

--------------090605030408070707010304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-02 10:49, Koen Kooi wrote:
> Op 1 dec. 2011, om 17:31 heeft Ulf Samuelsson het volgende geschreven:
>
>> 2011-12-01 16:37, Koen Kooi skrev:
>>> Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:
>>>
>>>
>>>> On 11/29/2011 03:06 PM, Koen Kooi wrote:
>>>>
>>>>> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:
>>>>>
>>>>>
>>>>>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>>>>
>>>>>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz"
>>>>>>>>   is no longer
>>>>>>>> available.
>>>>>>>>          tzdata , same problem.
>>>>>>>>          The recipe is located in two places.
>>>>>>>>          meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
>>>>>>>> problem
>>>>>>>>          This is what the build uses.
>>>>>>>>
>>>>>>> This is something to raise with the meta-oe maintainers. I think there
>>>>>>> isn't a problem in OECore.
>>>>>>>
>>>>>> Since we now have a large number of layers, maybe it is a good
>>>>>> idea to define in each layer,  how the "git send email" should behave in
>>>>>> by providing a better ".git/config" file in the trunk?
>>>>>>
>>>>>>
>>>>>> I.E:
>>>>>>
>>>>>> [sendemail]
>>>>>>    to =
>>>>>> openembedded-core@lists.openembedded.org
>>>>>>
>>>>>>
>>>>>> or
>>>>>> meta-angstrom/.git/config
>>>>>> [sendemail]
>>>>>>    to =
>>>>>> angstrom-distro-devel@linuxtogo.org
>>>>>>
>>>>>> [format]
>>>>>>    subjectprefix = "[meta-angstrom]"
>>>>>>
>>>>>>
>>>>>> No need to look in the README file with this.
>>>>>>
>>>>> That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers
>>>>>
>>>> Even if it is not the preferred way, it would direct the discussion to
>>>> the appropriate list. This would reduce the number of mis-directed
>>>> emails to this list.
>>>>
>>> You can't fix stupid, sadly.
>>>
>> Tend to disagree.
>> The whole purpose of OE is to make it possible for people,
>> stupid or not, to go off and make things which they would
>> not be able to do on their own.
>>
>> As I see it, it is no real drawback of adding this, and at least some benefit.
> The drawback is that people will postpone reading the README even longer.
>
> Why are you so dead against having people read the README?
I am against that every layer should *appear to* have their own way of 
treating feedback.

There should be a common README on how to provide a patch, and any
difference in where it ends up should be hidden in the system.
This will make it easy for the causal user of a layer.

If you want stuff to be pulled, then there are ways of handling this.
Instead of directing the email to a list, you could direct the mail
to a special address, which bounces back a message saying that
the recommended thing is to pull.
It could of course forward to the real list as well.

As mentioned before by me, and by Frans right now, If I have to set up a 
git mirror
for something I dont use (like meta-ti right now),
just because this has a problem which affects my builds, I won't do that.
As I dig deeper into openembedded-core, I will probably get
to setting up git mirrors for the layers I use.
OTOH , If I am bored and pull up my Beagleboard from a drawer, again
I would probably do a git mirror for meta-ti.

Some further study shows that the idea will not work as intended fully.
meta-openembedded and meta-handhelds have "meta-*" subdirectories
which each have their own README with different instructions for the 
same git tree.
Seems kind of strange to me.


BR
Ulf Samuelsson

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii


--------------090605030408070707010304
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 2011-12-02 10:49, Koen Kooi wrote:
    <blockquote
      cite="mid:5D177C90-C498-49C3-8FE3-AE1589ADB5A3@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 1 dec. 2011, om 17:31 heeft Ulf Samuelsson het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">2011-12-01 16:37, Koen Kooi skrev:
</pre>
        <blockquote type="cite">
          <pre wrap="">Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:


</pre>
          <blockquote type="cite">
            <pre wrap="">On 11/29/2011 03:06 PM, Koen Kooi wrote:

</pre>
            <blockquote type="cite">
              <pre wrap="">Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:


</pre>
              <blockquote type="cite">
                <pre wrap="">On 2011-11-29 16:03, Richard Purdie wrote:

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="">2.    <a class="moz-txt-link-rfc2396E" href="ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz">"ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz"</a>
 is no longer
available.
        tzdata , same problem.
        The recipe is located in two places.
        meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
problem
        This is what the build uses.

</pre>
                  </blockquote>
                  <pre wrap="">This is something to raise with the meta-oe maintainers. I think there
isn't a problem in OECore.

</pre>
                </blockquote>
                <pre wrap="">Since we now have a large number of layers, maybe it is a good
idea to define in each layer,  how the "git send email" should behave in
by providing a better ".git/config" file in the trunk?


I.E:

[sendemail]
  to = 
<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>


or
meta-angstrom/.git/config
[sendemail]
  to = 
<a class="moz-txt-link-abbreviated" href="mailto:angstrom-distro-devel@linuxtogo.org">angstrom-distro-devel@linuxtogo.org</a>

[format]
  subjectprefix = "[meta-angstrom]"


No need to look in the README file with this.

</pre>
              </blockquote>
              <pre wrap="">That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers

</pre>
            </blockquote>
            <pre wrap="">Even if it is not the preferred way, it would direct the discussion to
the appropriate list. This would reduce the number of mis-directed
emails to this list.

</pre>
          </blockquote>
          <pre wrap="">You can't fix stupid, sadly.

</pre>
        </blockquote>
        <pre wrap="">
Tend to disagree.
The whole purpose of OE is to make it possible for people,
stupid or not, to go off and make things which they would
not be able to do on their own.

As I see it, it is no real drawback of adding this, and at least some benefit.</pre>
      </blockquote>
      <pre wrap="">
The drawback is that people will postpone reading the README even longer.

Why are you so dead against having people read the README?</pre>
    </blockquote>
    I am against that every layer should *appear to* have their own way
    of treating feedback.<br>
    <br>
    There should be a common README on how to provide a patch, and any<br>
    difference in where it ends up should be hidden in the system.<br>
    This will make it easy for the causal user of a layer.<br>
    <br>
    If you want stuff to be pulled, then there are ways of handling
    this.<br>
    Instead of directing the email to a list, you could direct the mail<br>
    to a special address, which bounces back a message saying that<br>
    the recommended thing is to pull.<br>
    It could of course forward to the real list as well.<br>
    <br>
    As mentioned before by me, and by Frans right now, If I have to set
    up a git mirror<br>
    for something I dont use (like meta-ti right now), <br>
    just because this has a problem which affects my builds, I won't do
    that. <br>
    As I dig deeper into openembedded-core, I will probably get<br>
    to setting up git mirrors for the layers I use.<br>
    OTOH , If I am bored and pull up my Beagleboard from a drawer, again<br>
    I would probably do a git mirror for meta-ti. <br>
    <br>
    Some further study shows that the idea will not work as intended
    fully.<br>
    meta-openembedded and meta-handhelds have "meta-*" subdirectories <br>
    which each have their own README with different instructions for the
    same git tree.<br>
    Seems kind of strange to me.<br>
    <br>
    <br>
    BR<br>
    Ulf Samuelsson<br>
    <br>
    <blockquote
      cite="mid:5D177C90-C498-49C3-8FE3-AE1589ADB5A3@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Ulf Samuelsson
eMagii
</pre>
  </body>
</html>

--------------090605030408070707010304--
