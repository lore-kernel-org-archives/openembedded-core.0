Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0366011B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 15:06:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 07 Feb 2017 07:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208,217";a="56210687"
Received: from unknown (HELO [10.219.4.164]) ([10.219.4.164])
	by orsmga004.jf.intel.com with ESMTP; 07 Feb 2017 07:06:29 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
	<CAJTo0LZ+khtB9f==4KQr_iaVJhHmTGfFj-2toAnN=GFPiyUVDQ@mail.gmail.com>
	<CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <8ab28120-012b-4f16-e812-a06ad8b351b9@linux.intel.com>
Date: Tue, 7 Feb 2017 09:07:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com>
Cc: "mariano.lopez@intel.com" <mariano.lopez@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_populate_cve_db: Error in executing cve-check-update
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
X-List-Received-Date: Tue, 07 Feb 2017 15:06:33 -0000
Content-Type: multipart/alternative;
	boundary="------------C3F0F0C2008F2CD86CCA717F"

--------------C3F0F0C2008F2CD86CCA717F
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/02/17 09:17, Jussi Kukkonen wrote:
>
>
> On 6 February 2017 at 16:56, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>
>     On 6 February 2017 at 14:43, Sona Sarmadi <sona.sarmadi@enea.com
>     <mailto:sona.sarmadi@enea.com>> wrote:
>
>             bbdebug 2 "Updating cve-check-tool database located in
>         $cve_dir"
>             if cve-check-update -d "$cve_dir" ; then
>                 printf "CVE database was updated on %s UTC\n\n"
>         "$(LANG=C date --utc +'%F %T')" > "$cve_file"
>             else
>                 bbwarn "Error in executing cve-check-update" 
>         <<<<<<<<<<<<<<<<<<<<<<<<<
>
>
>     This definitely needs to be rewritten so you can see the output if
>     it fails.  Just run cve-check-update -d <dir> yourself and see
>     what it says.  Last time I had this failing it was because the
>     mitre servers were offline.
>
>
> Agreed about the error output.

Also you need to patch the tool, most of the time there is no output
from it; I think Ikey would integrate those patches without hesitation.

>
> I think recipe specific sysroots broke the setup somehow (so the tools
> are not actually in sysroot when they're needed). I'm taking a look at
> this tomorrow.

I tried today, but I'm having a hard time with the proxies (like always)
so I can't really verify this. Were you able to check?

Mariano

--------------C3F0F0C2008F2CD86CCA717F
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/02/17 09:17, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 6 February 2017 at 16:56, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div class="gmail_extra"><span class=""><br>
                    <div class="gmail_quote">On 6 February 2017 at
                      14:43, Sona Sarmadi <span dir="ltr">&lt;<a
                          moz-do-not-send="true"
                          href="mailto:sona.sarmadi@enea.com"
                          target="_blank">sona.sarmadi@enea.com</a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <div id="m_5881053407445794043:1vq"
                          class="m_5881053407445794043a3s
                          m_5881053407445794043aXjCH
                          m_5881053407445794043m15a13e1fae6963e3">   
                          bbdebug 2 "Updating cve-check-tool database
                          located in $cve_dir"<br>
                              if cve-check-update -d "$cve_dir" ; then<br>
                                  printf "CVE database was updated on %s
                          UTC\n\n" "$(LANG=C date --utc +'%F %T')" &gt;
                          "$cve_file"<br>
                              else<br>
                                  bbwarn "Error in executing
                          cve-check-update" 
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</div>
                      </blockquote>
                    </div>
                    <br>
                  </span>This definitely needs to be rewritten so you
                  can see the output if it fails.  Just run
                  cve-check-update -d &lt;dir&gt; yourself and see what
                  it says.  Last time I had this failing it was because
                  the mitre servers were offline.</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Agreed about the error output.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Also you need to patch the tool, most of the time there is no output
    from it; I think Ikey would integrate those patches without
    hesitation.<br>
    <br>
    <blockquote
cite="mid:CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>I think recipe specific sysroots broke the setup
              somehow (so the tools are not actually in sysroot when
              they're needed). I'm taking a look at this tomorrow.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I tried today, but I'm having a hard time with the proxies (like
    always) so I can't really verify this. Were you able to check?<br>
    <br>
    Mariano
  </body>
</html>

--------------C3F0F0C2008F2CD86CCA717F--
