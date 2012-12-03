Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1TfZ67-0000X4-EL
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 17:42:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id DDC48212003;
	Mon,  3 Dec 2012 09:28:00 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KuKJ+HV3YGQT; Mon,  3 Dec 2012 09:27:54 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 8128A138067;
	Mon,  3 Dec 2012 09:27:54 -0700 (MST)
Message-ID: <50BCD30A.5010104@se-eng.com>
Date: Mon, 03 Dec 2012 09:27:54 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Michael Halstead <michael@yoctoproject.org>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org> <50BA6C04.9040900@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F2064@IRSMSX101.ger.corp.intel.com>
	<50BCCC84.5050704@linux.intel.com>
	<50BCCD83.7040205@yoctoproject.org>
In-Reply-To: <50BCCD83.7040205@yoctoproject.org>
Cc: oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 16:42:24 -0000
Content-Type: multipart/alternative;
	boundary="------------030801070501030009050502"

--------------030801070501030009050502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/03/2012 09:04 AM, Michael Halstead wrote:
> On 12/03/2012 08:00 AM, Saul Wold wrote:
>> On 12/03/2012 07:20 AM, Prica, Mihai wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>> Of David Nystr=F6m
>>> Sent: Saturday, December 01, 2012 10:44 PM
>>> To: Michael Halstead
>>> Cc: oe-core layer
>>> Subject: Re: [OE-core] meta-cloud layer
>>>
>>> On 12/01/2012 12:23 AM, Michael Halstead wrote:
>>>> On 11/30/2012 12:17 PM, Raymond Danks wrote:
>>>>> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>>>>>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com
>>>>>>> <mailto:sgw@linux.intel.com>> wrote:
>>>>>>>
>>>>>>>        On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>>>>>>>
>>>>>>>            On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>>>>>
>>>>>>>                On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
>>>>>>> wrote:
>>>>>>>
>>>>>>>                    Thanks for looping me in here David. The initi=
al
>>>>>>>                    goal for the meta-xen
>>>>>>>                    layer was in fact to encompass Xen Cloud Platf=
orm.
>>>>>>>                     As such, the intent
>>>>>>>                    was to contain both hypervisor and user-space
>>>>>>>                    applications.  Indeed, the
>>>>>>>                    xen distribution itself includes xm/libxl;
>>>>>>>                    hypervisor abstraction would
>>>>>>>                    be somewhat tedious in my opinion.
>>>>>>>
>>>>>>>                    The layer just received commits for expanding =
the
>>>>>>>                    libvirt build to
>>>>>>>                    support qemu.  The commonalities and shared
>>>>>>> packaged
>>>>>>>                    between xen, qemu,
>>>>>>>                    and kvm implementations are such that I would =
also
>>>>>>>                    agree that meta-xen
>>>>>>>                    should be expanded/renamed to encompass all
>>>>>>>                    virtualization types; I also
>>>>>>>                    support the move to meta-virtualization.
>>>>>>>
>>>>>>>
>>>>>>>            meta-virtualization sounds good, let co-op on this so =
we
>>>>>>>            don't duplicate
>>>>>>>            work.
>>>>>>>
>>>>>>>        If everyone is OK with this, I will have Michael Halstead
>>>>>>> create
>>>>>>>        a repo, please send him your keys so that you will have wr=
ite
>>>>>>>        access to it.
>>>>>>>
>>>>>>>
>>>>>>> This works for me. If Michael already has our keys, do we need to
>>>>>>> resend or can a local copy happen ?
>>>>>> I already have keys for,
>>>>>>
>>>>>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>>>>>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>>>>>
>>>>>> Either of you can currently add
>>>>>> git@git.yoctoproject.org:meta-virtualization as a git remote and
>>>>>> start the repository. Once we have initial code and the maintainer=
s
>>>>>> and patch submission guidelines in the readme I can publicly list =
the
>>>>>> new repository.
>>>>>>
>>>>>> I require an ssh public key for Raymond Danks.
>>>>> Thanks Michael.  I got your response and was able to push meta-xen =
to
>>>>> the newly created repository on meta-virtualization.  I added one
>>>>> commit to tweak the README and conf/layer.conf for the new name.
>>>>>>
>>>>>> We also need a short description for the listing on
>>>>>> git.yoctoproject.org. I could be something similar to, but better
>>>>>> than, "Layer enabling virtualization support. "
>>>>> How about "Layer enabling hypervisor, virtualization tool stack, an=
d
>>>>> cloud support."
>>>>>
>>>> Sounds good to me. Thank you.
>>>>> Also - I referenced the mail alias meta-virtualization at yoctoproj=
ect
>>>>> in the README.  When you publish this, can we use something like th=
at
>>>>> as well?
>>>>>
>>>> I can add a private list for meta-virtualization@yoctoproject.org. W=
ho
>>>> shall I add to membership?
>>>>
>>>>
>>>> I would like to be added, since it seems I can't add myself at
>>>> https://lists.yoctoproject.org/listinfo
>>>>
>>>> Best Regards,
>>>> David
>>> I would like to be added as well to the private list.
>>>
>> Just to be clear to all this is not a private list, there was some
>> issue I think with getting it initialized, it is visiable and
>> available to all from the https://lists.yoctoproject.org/listinfo URL,
>> and it is getting added to the main list of Mailing lists today.
>>
>> Sorry for any confusion.
>>
>> Sau!
>>
> This was a misunderstanding on my part. I thought this was a simple mai=
l
> alias for the maintainers. A full list has been set up and can be seen
> at https://lists.yoctoproject.org/ or
> https://lists.yoctoproject.org/listinfo. Anyone can subscribe. I'm also
> working on getting this list added to Gmane for fans for NNTP.
>
Awesome.  Thanks Michael.  Thanks Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------030801070501030009050502
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/03/2012 09:04 AM, Michael
      Halstead wrote:<br>
    </div>
    <blockquote cite="mid:50BCCD83.7040205@yoctoproject.org" type="cite">
      <pre wrap="">On 12/03/2012 08:00 AM, Saul Wold wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 12/03/2012 07:20 AM, Prica, Mihai wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core-bounces@lists.openembedded.org">openembedded-core-bounces@lists.openembedded.org</a>
[<a class="moz-txt-link-freetext" href="mailto:openembedded-core-bounces@lists.openembedded.org">mailto:openembedded-core-bounces@lists.openembedded.org</a>] On Behalf
Of David Nystr&ouml;m
Sent: Saturday, December 01, 2012 10:44 PM
To: Michael Halstead
Cc: oe-core layer
Subject: Re: [OE-core] meta-cloud layer

On 12/01/2012 12:23 AM, Michael Halstead wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">On 11/30/2012 12:17 PM, Raymond Danks wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">On 11/30/2012 11:03 AM, Michael Halstead wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="">On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="">


On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold &lt;<a class="moz-txt-link-abbreviated" href="mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>
<a class="moz-txt-link-rfc2396E" href="mailto:sgw@linux.intel.com">&lt;mailto:sgw@linux.intel.com&gt;</a>&gt; wrote:

      On 11/30/2012 03:29 AM, David Nystr&ouml;m wrote:

          On 11/29/2012 02:54 PM, Richard Purdie wrote:

              On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
wrote:

                  Thanks for looping me in here David. The initial
                  goal for the meta-xen
                  layer was in fact to encompass Xen Cloud Platform.
                   As such, the intent
                  was to contain both hypervisor and user-space
                  applications.  Indeed, the
                  xen distribution itself includes xm/libxl;
                  hypervisor abstraction would
                  be somewhat tedious in my opinion.

                  The layer just received commits for expanding the
                  libvirt build to
                  support qemu.  The commonalities and shared
packaged
                  between xen, qemu,
                  and kvm implementations are such that I would also
                  agree that meta-xen
                  should be expanded/renamed to encompass all
                  virtualization types; I also
                  support the move to meta-virtualization.


          meta-virtualization sounds good, let co-op on this so we
          don't duplicate
          work.

      If everyone is OK with this, I will have Michael Halstead
create
      a repo, please send him your keys so that you will have write
      access to it.


This works for me. If Michael already has our keys, do we need to
resend or can a local copy happen ?
</pre>
                </blockquote>
                <pre wrap="">I already have keys for,

David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02

Either of you can currently add
<a class="moz-txt-link-abbreviated" href="mailto:git@git.yoctoproject.org:meta-virtualization">git@git.yoctoproject.org:meta-virtualization</a> as a git remote and
start the repository. Once we have initial code and the maintainers
and patch submission guidelines in the readme I can publicly list the
new repository.

I require an ssh public key for Raymond Danks.
</pre>
              </blockquote>
              <pre wrap="">Thanks Michael.  I got your response and was able to push meta-xen to
the newly created repository on meta-virtualization.  I added one
commit to tweak the README and conf/layer.conf for the new name.
</pre>
              <blockquote type="cite">
                <pre wrap="">

We also need a short description for the listing on
git.yoctoproject.org. I could be something similar to, but better
than, "Layer enabling virtualization support. "
</pre>
              </blockquote>
              <pre wrap="">How about "Layer enabling hypervisor, virtualization tool stack, and
cloud support."

</pre>
            </blockquote>
            <pre wrap="">Sounds good to me. Thank you.
</pre>
            <blockquote type="cite">
              <pre wrap="">Also - I referenced the mail alias meta-virtualization at yoctoproject
in the README.  When you publish this, can we use something like that
as well?

</pre>
            </blockquote>
            <pre wrap="">I can add a private list for <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a>. Who
shall I add to membership?


I would like to be added, since it seems I can't add myself at
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo">https://lists.yoctoproject.org/listinfo</a>

Best Regards,
David
</pre>
          </blockquote>
          <pre wrap="">
I would like to be added as well to the private list.

</pre>
        </blockquote>
        <pre wrap="">Just to be clear to all this is not a private list, there was some
issue I think with getting it initialized, it is visiable and
available to all from the <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo">https://lists.yoctoproject.org/listinfo</a> URL,
and it is getting added to the main list of Mailing lists today.

Sorry for any confusion.

Sau!

</pre>
      </blockquote>
      <pre wrap="">This was a misunderstanding on my part. I thought this was a simple mail
alias for the maintainers. A full list has been set up and can be seen
at <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/">https://lists.yoctoproject.org/</a> or
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo">https://lists.yoctoproject.org/listinfo</a>. Anyone can subscribe. I'm also
working on getting this list added to Gmane for fans for NNTP.

</pre>
    </blockquote>
    Awesome.&nbsp; Thanks Michael.&nbsp; Thanks Sau!<br>
    <blockquote cite="mid:50BCCD83.7040205@yoctoproject.org" type="cite">
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030801070501030009050502--
