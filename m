Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT8dt-0005LH-K5
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 09:57:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN8om2c006839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 00:50:48 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 00:50:48 -0800
Message-ID: <4ECCB3A6.5010004@windriver.com>
Date: Wed, 23 Nov 2011 16:49:42 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
	<28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net>
In-Reply-To: <28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 0/9] The patches to run gtk over directfb
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
X-List-Received-Date: Wed, 23 Nov 2011 08:57:22 -0000
Content-Type: multipart/alternative;
	boundary="------------070803020905000202050301"

--------------070803020905000202050301
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?11?23? 15:31, Koen Kooi wrote:
> Op 23 nov. 2011, om 07:47 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Hi Richard&  all,
>>
>> I fixed some problems found at previous submitting and use PACKAGECONFIG to get mutual configuration between directfb and x11. I hope this submitting isn't a horrible mess :).
>>
>> One previous problem about what happen when user want to have both directfb and x11 in DISTRO_FEATURES?
> That was the question I was going to ask
>
>> I think directfb and x11 can't be defined in DISTRO_FEATURES at the same time because directfb and x11 are the lowest level library for GUI with different mechanism.
> I don't understand what the above means, but I've been building both directfb and x11 for some years now and they don't clash.
>
Hi koen,

Thanks for your comment.
I want to build an image only including directfb and gtk without x11. 
There are no any stuff related to x11 in this image. You know, directfb 
often is used in many embedded device because directfb is enough for 
their requirement. Perhaps they feel more familiar with directfb or gtk+ 
rather than x11. The purpose of building this image is for some people 
who  want to use yocto to develop their production getting  an image 
based on directfb anf gtk+ very easily.  So it need an mechanism making 
an mutual operation between directfb and x11 when compiling 
core-image-gtk-directfb for getting directfb image without x11. Of 
course, you can add directfb to DISTRO_FEATURES with x11, if you want to 
have both of them. But if you want to get an image without x11, then I 
think you can only remove x11 from DISTRO_FEATURES at current status 
because x11 is the default configuration.
>> x11 and directfb should be mutual in DISTRO_FEATURES. User may use file "meta-yocto/conf/local.conf.sample.extended" to select the mode they want to need.
>> but directfb can work in an image with x11. for example, "directfb" and "direcrfb-examples" can be added to task-core-x11-sato.bb. you can run df_andi, a demo based on directfb, on matchbox term running on core-image-sato with x11. So directfb and x11 can exist in the same image but not be defined in DISTRO_FEATURES at same time.
>>
>> If you have any suggestion, I will fix them again.
> Last time I looked both gtk+ and pango had their backend modularized, so you can build both and install the right one in the rootfs. I think that would be a better way to go. Just look at debian with their gtk-directfb installer, they have gtk-X as well :)
>
I know what you mean. It could be a good method to have both in an 
image. It may become a new task after completing  this feature.

Thanks
Yan
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070803020905000202050301
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;11&#26376;23&#26085; 15:31, Koen Kooi wrote:
    <blockquote
      cite="mid:28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 23 nov. 2011, om 07:47 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

Hi Richard &amp; all,

I fixed some problems found at previous submitting and use PACKAGECONFIG to get mutual configuration between directfb and x11. I hope this submitting isn't a horrible mess :).

One previous problem about what happen when user want to have both directfb and x11 in DISTRO_FEATURES?
</pre>
      </blockquote>
      <pre wrap="">
That was the question I was going to ask

</pre>
      <blockquote type="cite">
        <pre wrap="">I think directfb and x11 can't be defined in DISTRO_FEATURES at the same time because directfb and x11 are the lowest level library for GUI with different mechanism.
</pre>
      </blockquote>
      <pre wrap="">
I don't understand what the above means, but I've been building both directfb and x11 for some years now and they don't clash.

</pre>
    </blockquote>
    Hi koen,<br>
    <br>
    Thanks for your comment.<br>
    I want to build an image only including directfb and gtk without
    x11. There are no any stuff related to x11 in this image. You know,
    directfb often is used in many embedded device because directfb is
    enough for their requirement. Perhaps they feel more familiar <span></span><span></span>with
    directfb or gtk+ rather than x11. The purpose of building this image
    is for some people who&nbsp; want to use yocto to develop their
    production getting&nbsp; an image based on directfb anf gtk+ very
    easily.&nbsp; So it need an mechanism making an mutual operation between
    directfb and x11 when compiling core-image-gtk-directfb for getting
    directfb image without x11. Of course, you can add directfb to
    DISTRO_FEATURES with x11, if you want to have both of them. But if
    you want to get an image without x11, then I think you can only
    remove x11 from DISTRO_FEATURES at current status because x11 is the
    default configuration.<br>
    <blockquote
      cite="mid:28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net"
      type="cite">
      <pre wrap=""></pre>
      <blockquote type="cite">
        <pre wrap="">x11 and directfb should be mutual in DISTRO_FEATURES. User may use file "meta-yocto/conf/local.conf.sample.extended" to select the mode they want to need.
but directfb can work in an image with x11. for example, "directfb" and "direcrfb-examples" can be added to task-core-x11-sato.bb. you can run df_andi, a demo based on directfb, on matchbox term running on core-image-sato with x11. So directfb and x11 can exist in the same image but not be defined in DISTRO_FEATURES at same time.

If you have any suggestion, I will fix them again.
</pre>
      </blockquote>
      <pre wrap="">
Last time I looked both gtk+ and pango had their backend modularized, so you can build both and install the right one in the rootfs. I think that would be a better way to go. Just look at debian with their gtk-directfb installer, they have gtk-X as well :)

</pre>
    </blockquote>
    I know what you mean. It could be a good method to have both in an
    image. It may become a new task after completing&nbsp; this feature.<br>
    <br>
    Thanks<br>
    Yan<br>
    <blockquote
      cite="mid:28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net"
      type="cite">
      <pre wrap="">regards,

Koen</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070803020905000202050301--
