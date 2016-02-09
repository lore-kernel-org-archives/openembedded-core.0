Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id EAC1E73197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:52:19 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id BBB962AB18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:52:19 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56B9C4E3.6040006@pseudoterminal.org>
Date: Tue, 9 Feb 2016 11:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Tue, 09 Feb 2016 10:52:20 -0000
Content-Type: multipart/alternative;
	boundary="------------000403060904070906080706"

--------------000403060904070906080706
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This is very interesting. Once gobject introspection is in place, vala 
based software like Rygel can finally be compiled directly from the vala 
source, which makes it much easier to apply patches against it.
Also, I think the GStreamer 1.0 Python bindings need GIR. This recipe 
could then be reintroduced (it was there, but got removed).

On 2015-12-17 10:16, Chris Trobridge wrote:
> Hi,
>
> I have done some testing of Alex's branch 
> "akanavin/gobject-introspection-experimental", originally 
> http://patchwork.openembedded.org/patch/107089/ 
> <http://patchwork.openembedded.org/patch/107089/%0A><http://patchwork.openembedded.org/patch/107089/%0A>
>
> I have built this successfully for x86 and x64 targets on an x64 build 
> machine:
>
> meta
> meta-yocto
> meta-yocto-bsp    = 
> "akanavin/gobject-introspection-experimental:04c7746ce90abc14604dec3328b9472c53cccf98"
> meta-networking
> meta-oe
> meta-python       = "master:47f7d287a09329734629cb9d194ef4e077117d79"
> meta-haswell-wc
> meta-intel        = "master:6e91701dcf68f9351db8bb0b92eb2d26af1b8f7f"
> meta-systemd      = "master:47f7d287a09329734629cb9d194ef4e077117d79"
>
> Specifically, it built for the qemux86, qemux86-64 and hasell-wc machines.
>
> I have successfully run my own python3 service, which uses python3 
> dbus and GObject from gi.repository.
>
> I have also inherited gobject-introspection into modemmanager_1.4.2.bb 
> from meta-oe, which fixed the recipe building and I have checked that 
> the target executable runs but not tested its dbus interface yet.
>
> Regards,
> Chris
>
>
>


--------------000403060904070906080706
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    This is very interesting. Once gobject introspection is in place,
    vala based software like Rygel can finally be compiled directly from
    the vala source, which makes it much easier to apply patches against
    it.<br>
    Also, I think the GStreamer 1.0 Python bindings need GIR. This
    recipe could then be reintroduced (it was there, but got removed).<br>
    <br>
    <div class="moz-cite-prefix">On 2015-12-17 10:16, Chris Trobridge
      wrote:<br>
    </div>
    <blockquote cite="mid:DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl"
      type="cite">
      <style><!--
.hmmessage P
{
margin:0px;
padding:0px
}
body.hmmessage
{
font-size: 12pt;
font-family:Calibri
}
--></style>
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>I have done some testing of Alex's branch
          "akanavin/gobject-introspection-experimental", originally <a
            moz-do-not-send="true"
            href="http://patchwork.openembedded.org/patch/107089/%0A"
            target="_blank" style="font-size: 12pt;"><a class="moz-txt-link-freetext" href="http://patchwork.openembedded.org/patch/107089/">http://patchwork.openembedded.org/patch/107089/</a></a><a
            moz-do-not-send="true"
            href="http://patchwork.openembedded.org/patch/107089/%0A"
            target="_blank" style="font-size: 12pt;"> </a></div>
        <div><br>
        </div>
        <div>I have built this successfully for x86 and x64 targets on
          an x64 build machine:</div>
        <div><br>
        </div>
        <div>
          <div>meta              </div>
          <div>meta-yocto        </div>
          <div>meta-yocto-bsp    =
"akanavin/gobject-introspection-experimental:04c7746ce90abc14604dec3328b9472c53cccf98"</div>
          <div>meta-networking   </div>
          <div>meta-oe           </div>
          <div>meta-python       =
            "master:47f7d287a09329734629cb9d194ef4e077117d79"</div>
          <div><span style="font-size: 12pt;">meta-haswell-wc   </span></div>
          <div>meta-intel        =
            "master:6e91701dcf68f9351db8bb0b92eb2d26af1b8f7f"</div>
          <div>meta-systemd      =
            "master:47f7d287a09329734629cb9d194ef4e077117d79"</div>
        </div>
        <div><br>
        </div>
        <div>Specifically, it built for the qemux86, qemux86-64 and
          hasell-wc machines.</div>
        <div><br>
        </div>
        <div>I have successfully run my own python3 service, which uses
          python3 dbus and GObject from gi.repository.</div>
        <div><br>
        </div>
        <div>I have also inherited gobject-introspection
          into modemmanager_1.4.2.bb from meta-oe, which fixed the
          recipe building and I have checked that the target executable
          runs but not tested its dbus interface yet.</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Chris</div>
        <div><br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------000403060904070906080706--
