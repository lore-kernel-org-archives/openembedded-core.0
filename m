Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQgrC-0006Rs-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:57:30 +0200
Received: from localhost ([127.0.0.1]:33026 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgeA-0004l1-LY; Tue, 23 Oct 2012 15:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=/pVOIVpajvt8eiVjgp6ZAx2rcaI=; b=HvcFvI/xFkZrbo0mcj1CPMYBEq2j
	aN0N/tfq/zFqRqCXix7bXmfUaTMNiF6b4x5OuyNgelbTxL53FpCJ6/roxRSlnxm/
	YlP5bIj8T3PDL0v9+b1HgFhPhg8KPMjZetD1Saic4gsGoLUOIQC8+xZcffvoJyTA
	JCC13EInZ8L1ELA=
Received: from [195.171.99.130] (port=44041 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TQgeA-0004kx-Bz; Tue, 23 Oct 2012 15:44:02 +0000
Message-ID: <5086BBB2.7070601@communistcode.co.uk>
Date: Tue, 23 Oct 2012 16:45:54 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
	<5086B713.30708@communistcode.co.uk>
	<CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
Subject: Re: Issues building meta-toolchain, libxau
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 15:57:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/12 16:30, Burton, Ross wrote:
> On 23 October 2012 16:26, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> No, it is not a clean build. However I got quite reckless with the -c
>> cleansstate at one point which didn't seem to help.
> cleansstate on libx11 / xtrans / libxau should clear out everything
> that's got all confused.
>
> Ross

 > bitbake -c cleansstate nativesdk-libxau nativesdk-libx11 
nativesdk-xtrans libxau libx11 xtrans

 > bitbake meta-toolchain

| ../x86_64-pokysdk-linux-libtool  --tag=CC   --mode=link 
x86_64-pokysdk-linux-gcc 
--sysroot=/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux 
-std=gnu99 -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT 
-I/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/include 
-DMALLOC_0_RETURNS_NULL 
-isystem/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/include 
-O2 -pipe -version-number 6:3:0 -no-undefined 
-L/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-Wl,-rpath-link,/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-Wl,-rpath,/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-Wl,-O1 
-L/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/lib 
-Wl,-rpath-link,/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/lib 
-Wl,-rpath,/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/lib 
-Wl,-O1 -o libX11.la -rpath 
/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib AllCells.lo 
AllowEv.lo AllPlanes.lo AutoRep.lo Backgnd.lo BdrWidth.lo Bell.lo 
Border.lo ChAccCon.lo ChActPGb.lo ChClMode.lo ChCmap.lo ChGC.lo 
ChKeyCon.lo ChkIfEv.lo ChkMaskEv.lo ChkTypEv.lo ChkTypWEv.lo ChkWinEv.lo 
ChPntCon.lo ChProp.lo ChSaveSet.lo ChWAttrs.lo ChWindow.lo CirWin.lo 
CirWinDn.lo CirWinUp.lo ClDisplay.lo ClearArea.lo Clear.lo ConfWind.lo 
Context.lo ConvSel.lo CopyArea.lo CopyCmap.lo CopyGC.lo CopyPlane.lo 
CrBFData.lo CrCmap.lo CrCursor.lo CrGC.lo CrGlCur.lo CrPFBData.lo 
CrPixmap.lo CrWindow.lo Cursor.lo DefCursor.lo DelProp.lo Depths.lo 
DestSubs.lo DestWind.lo DisName.lo DrArc.lo DrArcs.lo DrLine.lo 
DrLines.lo DrPoint.lo DrPoints.lo DrRect.lo DrRects.lo DrSegs.lo 
ErrDes.lo ErrHndlr.lo evtomask.lo EvToWire.lo FetchName.lo FillArc.lo 
FillArcs.lo FillPoly.lo FillRct.lo FillRcts.lo FilterEv.lo Flush.lo 
Font.lo FontInfo.lo FontNames.lo FreeCmap.lo FreeCols.lo FreeCurs.lo 
FreeEData.lo FreeEventData.lo FreeGC.lo FreePix.lo FSSaver.lo FSWrap.lo 
GCMisc.lo Geom.lo GetAtomNm.lo GetColor.lo GetDflt.lo GetEventData.lo 
GetFPath.lo GetFProp.lo GetGCVals.lo GetGeom.lo GetHColor.lo GetHints.lo 
GetIFocus.lo GetImage.lo GetKCnt.lo GetMoEv.lo GetNrmHint.lo GetPCnt.lo 
GetPntMap.lo GetProp.lo GetRGBCMap.lo GetSOwner.lo GetSSaver.lo 
GetStCmap.lo GetTxtProp.lo GetWAttrs.lo GetWMCMapW.lo GetWMProto.lo 
globals.lo GrButton.lo GrKeybd.lo GrKey.lo GrPointer.lo GrServer.lo 
Host.lo Iconify.lo IfEvent.lo imConv.lo ImText16.lo ImText.lo ImUtil.lo 
InitExt.lo InsCmap.lo IntAtom.lo KeyBind.lo KeysymStr.lo KillCl.lo 
LiHosts.lo LiICmaps.lo LiProps.lo ListExt.lo LoadFont.lo LockDis.lo 
locking.lo LookupCol.lo LowerWin.lo Macros.lo MapRaised.lo MapSubs.lo 
MapWindow.lo MaskEvent.lo Misc.lo ModMap.lo MoveWin.lo NextEvent.lo 
OCWrap.lo OMWrap.lo OpenDis.lo ParseCmd.lo ParseCol.lo ParseGeom.lo 
PeekEvent.lo PeekIfEv.lo Pending.lo PixFormats.lo PmapBgnd.lo 
PmapBord.lo PolyReg.lo PolyTxt16.lo PolyTxt.lo PropAlloc.lo PutBEvent.lo 
PutImage.lo Quarks.lo QuBest.lo QuColor.lo QuColors.lo QuCurShp.lo 
QuExt.lo QuKeybd.lo QuPntr.lo QuStipShp.lo QuTextE16.lo QuTextExt.lo 
QuTileShp.lo QuTree.lo RaiseWin.lo RdBitF.lo RecolorC.lo ReconfWin.lo 
ReconfWM.lo Region.lo RegstFlt.lo RepWindow.lo RestackWs.lo RotProp.lo 
ScrResStr.lo SelInput.lo SendEvent.lo SetBack.lo SetClMask.lo 
SetClOrig.lo SetCRects.lo SetDashes.lo SetFont.lo SetFore.lo SetFPath.lo 
SetFunc.lo SetHints.lo SetIFocus.lo SetLocale.lo SetLStyle.lo 
SetNrmHint.lo SetPMask.lo SetPntMap.lo SetRGBCMap.lo SetSOwner.lo 
SetSSaver.lo SetState.lo SetStCmap.lo SetStip.lo SetTile.lo SetTSOrig.lo 
SetTxtProp.lo SetWMCMapW.lo SetWMProto.lo StBytes.lo StColor.lo 
StColors.lo StName.lo StNColor.lo StrKeysym.lo StrToText.lo Sync.lo 
Synchro.lo Text16.lo Text.lo TextExt16.lo TextExt.lo TextToStr.lo 
TrCoords.lo UndefCurs.lo UngrabBut.lo UngrabKbd.lo UngrabKey.lo 
UngrabPtr.lo UngrabSvr.lo UninsCmap.lo UnldFont.lo UnmapSubs.lo 
UnmapWin.lo VisUtil.lo WarpPtr.lo Window.lo WinEvent.lo Withdraw.lo 
WMGeom.lo WMProps.lo WrBitF.lo xcb_disp.lo xcb_io.lo XlibAsync.lo 
XlibInt.lo Xrm.lo    xlibi18n/libi18n.la  xkb/libxkb.la 
-L/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib 
-lxcb   -ldl
| /usr/bin/grep: 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la: 
No such file or directory
| 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux//bin/sed: 
can't read 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la: 
No such file or directory
| x86_64-pokysdk-linux-libtool: link: 
`/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la' 
is not a valid libtool archive
| make[3]: *** [libX11.la] Error 1
| make[3]: Leaving directory 
`/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-libx11-1_1.5.0-r10.2/libX11-1.5.0/src'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory 
`/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-libx11-1_1.5.0-r10.2/libX11-1.5.0/src'
| make[1]: *** [all] Error 2
| make[1]: Leaving directory 
`/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-libx11-1_1.5.0-r10.2/libX11-1.5.0/src'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-libx11-1_1.5.0-r10.2/temp/log.do_compile.29897 
for further information)
ERROR: Task 1337 
(virtual:nativesdk:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1781 tasks of which 1742 didn't need to 
be rerun and 1 failed.
No currently running tasks (1781 of 1835)


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



