Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TtgFv-0007jr-Ab
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:10:53 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so1871098lab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+A28h3hmtG2nxszHh8r9KZAPV7od27GlkYZoe1/vVSU=;
	b=EZ0gdgbxZQxmCamvhdWpxhdfNaCoeOZuimMYF5cvuMjk9DyoBQGOqSaLl0SCxEk9ja
	xVnB8hOLHNhpShMRQ9qc+l5qAQ44VkzgFSy5Y9RSEvXJdNn9ObtK++e5urv9ObH900xp
	krjxaeZ9Io+dz/WOoEULXGWxBd1+8/8YU/nv8OtPJ2+Mafd1csZi8bYr/GZxvvGrcHvK
	JE7k1SHzPp9vb4lfX9WxgzCusUr9OaDgmkEqN/h9Lf1cwY9vqIpaRYC2HGqk6xjZ8J5d
	Bss34qOAkyAH1Ql3uI/fz9vyNeuZiYgVF5OedTuBe+H3Q35NMW9D4OtLMWL9TDuHmQ1X
	XWzQ==
Received: by 10.152.134.243 with SMTP id pn19mr72504807lab.11.1357916136250;
	Fri, 11 Jan 2013 06:55:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Fri, 11 Jan 2013 06:55:15 -0800 (PST)
In-Reply-To: <50EFB0B5.4000700@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
	<1357807806-31720-4-git-send-email-martiert@gmail.com>
	<CABcZANkEeDdxgrb-2JqU19aofCgGor79wqKhvqktg+M34kenBg@mail.gmail.com>
	<50EFB0B5.4000700@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Jan 2013 07:55:15 -0700
X-Google-Sender-Auth: M4xOr1UMlehCv8uTQhbmKWFhIjA
Message-ID: <CABcZANkgrunyjHVjXbCk23jgj+d3TL8845rOetHFLJ_3EAozSA@mail.gmail.com>
To: Martin Ertsaas <martiert@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] lib/oe/path.py: Use shutil.rmtree if the path we wish to remove is a directory.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 15:10:54 -0000
Content-Type: multipart/alternative; boundary=f46d04427248ef9d1904d3047ccd

--f46d04427248ef9d1904d3047ccd
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 10, 2013 at 11:27 PM, Martin Ertsaas <martiert@gmail.com> wrote:

>  On 01/10/13 15:15, Chris Larson wrote:
>
>
> On Thu, Jan 10, 2013 at 1:50 AM, Martin Ertsaas <martiert@gmail.com>wrote:
>
>> On mac, os.unlink can not be done to remove directories, and so we have to
>> explicitly use shutil.rmtree instead to support mac.
>>
>
>  As pointed out for the bitbake patch, the functions can already handle
> this case if you pass recurse=True, and mac isn't at all special in this
> context.
>  --
> Christopher Larson
>
> True. In this case though, I feel the patch is still valid though, and
> that I should instead change the commit message. What I want from this
> patch, as I see it again now, is to not duplicate the same code in both
> bitbake and oe-core, when the oe-core function 'remove' can just be calling
> bb.utils.remove. So personally I still want this patch, I just wish to
> change the commit message to something sane. Agreed?
>

Agreed.
-- 
Christopher Larson

--f46d04427248ef9d1904d3047ccd
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Thu, Jan 10, 2013 at 11:27 PM, Martin Ertsaas <span dir="ltr">&lt;<a href="mailto:martiert@gmail.com" target="_blank">martiert@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="adM">
  
    
  
  </div><div bgcolor="#FFFFFF" text="#000000"><div class="adM"><div class="im">
    On 01/10/13 15:15, Chris Larson wrote:
    <blockquote type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Jan 10, 2013 at 1:50 AM,
            Martin Ertsaas <span dir="ltr">&lt;<a href="mailto:martiert@gmail.com" target="_blank">martiert@gmail.com</a>&gt;</span> wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div>On mac, os.unlink can not be done to remove
                directories, and so we have to<br>
                explicitly use shutil.rmtree instead to support mac.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>As pointed out for the bitbake patch, the
              functions can already handle this case if you pass
              recurse=True, and mac isn&#39;t at all special in this
              context.</div>
          </div>
          -- <br>
          Christopher Larson</div>
      </div>
    </blockquote></div></div>
    True. In this case though, I feel the patch is still valid though,
    and that I should instead change the commit message. What I want
    from this patch, as I see it again now, is to not duplicate the same
    code in both bitbake and oe-core, when the oe-core function &#39;remove&#39;
    can just be calling bb.utils.remove. So personally I still want this
    patch, I just wish to change the commit message to something sane.
    Agreed?</div></blockquote></div><br>Agreed.<br>-- <br>Christopher Larson</div></div>

--f46d04427248ef9d1904d3047ccd--
